#!/usr/bin/env bash
# Portão de cobertura para Flutter (PGC 5).
# O `flutter test --coverage` gera coverage/lcov.info mas não tem limite
# embutido; este script soma as linhas (LF) e as linhas cobertas (LH) do lcov
# e reprova se a porcentagem ficar abaixo do mínimo.
#
# Uso: bash scripts/cobertura.sh [minimo]   (padrão: 60)
set -euo pipefail

MINIMO="${1:-60}"
ARQUIVO="${LCOV_ARQUIVO:-coverage/lcov.info}"

if [ ! -f "$ARQUIVO" ]; then
  echo "::error::$ARQUIVO não encontrado. Rode 'flutter test --coverage' antes."
  exit 1
fi

awk -F: -v minimo="$MINIMO" '
  /^LF:/ { total += $2 }
  /^LH:/ { cobertas += $2 }
  END {
    if (total == 0) { print "::error::Nenhuma linha instrumentada no lcov."; exit 1 }
    pct = 100 * cobertas / total
    printf "Cobertura de linhas: %.2f%% (%d de %d) | mínimo: %s%%\n", pct, cobertas, total, minimo
    if (pct + 0.0001 < minimo) {
      printf "::error::Cobertura %.2f%% abaixo do mínimo de %s%%.\n", pct, minimo
      exit 1
    }
  }
' "$ARQUIVO"
