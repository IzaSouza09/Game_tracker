# 0002 — O CI bloqueia só vulnerabilidades críticas; risco "high" aceito com prazo de revisão

Status: aceito
Data: 23/11/2026
Revisão até: 23/02/2027

## Contexto

O job `dependencias` do `ci.yml` usa `actions/dependency-review-action` com `fail-on-severity: critical` (PGC 5.3). Na Aula 4 conferimos **Security → Dependabot alerts**. Resultado no Game Tracker em 23/11/2026: **nenhum alerta aberto** (0 abertos, 0 fechados), com Dependency graph, Dependabot alerts e security updates ativados.

As dependências diretas do app são poucas: `flutter` (SDK), `cupertino_icons` em produção, e `flutter_test`/`flutter_lints` só em desenvolvimento. As demais são transitivas e quase todas fixadas pelo próprio SDK do Flutter (não podemos atualizá-las sozinhas).

## Decisão

Manter `fail-on-severity: critical`. Alertas `high` não bloqueiam o merge, mas:

1. São avaliados quando aparecem: se vierem de dependência de **produção**, abrimos Issue `fix(deps): ...` e corrigimos em até 30 dias.
2. Se vierem só de ferramentas de **desenvolvimento** ou de pacotes fixados pelo SDK do Flutter, o risco é aceito até a próxima atualização do Flutter.
3. Esta decisão é revista na data acima; se houver alerta `high` de produção em aberto nessa data, subimos o limite para `high`.

## Alternativas consideradas

- **`fail-on-severity: high`:** mais seguro, mas um alerta em pacote transitivo fixado pelo SDK travaria todos os PRs sem que pudéssemos corrigir.
- **Desligar a análise de dependências:** contraria o PGC 5.3 e esconde riscos.

## Consequências

- O fluxo de PR não trava por vulnerabilidades que não controlamos.
- Fica um risco residual aceito e documentado, com dono (Desenvolvedora Líder) e prazo.
- O Dependabot (`.github/dependabot.yml`) abre PRs semanais `chore(deps): ...` que ajudam a zerar os alertas.
