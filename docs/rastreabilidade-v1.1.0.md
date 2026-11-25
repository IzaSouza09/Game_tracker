# Rastreabilidade da Release v1.1.0 (PGC 10)

Reconstrução da v1.1.0 só com links. Elo ausente = falha de processo.

| Elo | Link | Observação |
|---|---|---|
| Release v1.1.0 | https://github.com/IzaSouza09/Game_tracker/releases/tag/v1.1.0 | Notas geradas por `scripts/proxima-versao.mjs`, pacote `Game_tracker-1.1.0.zip` anexado |
| Commit da tag | https://github.com/IzaSouza09/Game_tracker/commit/c9732cc087f8cb6af08e04971bb2d9c9a0b06c24 | Squash do PR #16 na `main` |
| PR que gerou o commit | https://github.com/IzaSouza09/Game_tracker/pull/16 | `feat(modelos): adiciona Hollow Knight à biblioteca` → minor (1.0.1 → 1.1.0) |
| Revisão e aprovação do par | https://github.com/IzaSouza09/Game_tracker/pull/16 (aba Conversation) | Aprovado por @leticiabreuh |
| Execução do CI que liberou o merge | https://github.com/IzaSouza09/Game_tracker/actions/runs/45295090607 | Lint, testes com cobertura, build e SCA verdes; título validado em https://github.com/IzaSouza09/Game_tracker/actions/runs/45295090604 |
| Issue de origem | https://github.com/IzaSouza09/Game_tracker/issues/13 | `Closes #13` na descrição do PR |
| Aprovação da produção | https://github.com/IzaSouza09/Game_tracker/actions/runs/45295367513 | Job **Produção** aprovado no Environment `production` por @IzaSouza09 |

## Depois da release

- Rollback para v1.0.0 (exercício da Aula 3): Issue https://github.com/IzaSouza09/Game_tracker/issues/24 e PR `revert:` https://github.com/IzaSouza09/Game_tracker/pull/25.

## Falhas de processo encontradas

- Nenhuma na cadeia da v1.1.0: todos os elos existem.
- Histórico anterior ao PGC (setembro/outubro): commits `ok`, `Merge branch 'main'...` e `teste: push direto na main` entraram direto na `main`, antes da proteção de branch e do padrão Conventional Commits. A partir do PR #6 todo commit da `main` vem de PR revisado.
