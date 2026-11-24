# 0001 — Produção do Game Tracker é a Release do GitHub com o pacote web anexado

Status: aceito
Data: 23/11/2026

## Contexto

O Game Tracker é um app Flutter sem servidor próprio nem conta em loja de aplicativos (Google Play, Microsoft Store). Mesmo assim, o PGC (seções 6 e 9) exige um ambiente de produção com aprovação manual, uma baseline identificável por versão e um caminho de rollback. Precisávamos de um "lugar" de produção gratuito, auditável e que funcionasse em repositório público pelo site do GitHub.

## Decisão

Produção é a **Release do GitHub** marcada como *Latest*. O workflow `cd.yml` gera um único pacote (`flutter build web`, compactado em `Game_tracker-X.Y.Z.zip`), testa esse pacote em `staging` e, após a aprovação no Environment `production`, cria a tag anotada `vX.Y.Z` e a Release com o zip e as notas geradas por `scripts/proxima-versao.mjs`. O mesmo pacote pode, opcionalmente, ser publicado no GitHub Pages (`PUBLICAR_PAGES=true`).

## Alternativas consideradas

- **Publicar na Google Play (trilha de teste interno):** exige conta de desenvolvedor paga e assinatura do app; inviável para a disciplina.
- **Só GitHub Pages, sem Release:** não deixa uma baseline com pacote anexado e notas; o rollback dependeria de rebuild de código antigo.
- **Hospedagem externa (Firebase Hosting, Netlify):** exige segredos e contas extras, e PRs do Dependabot não recebem segredos.

## Consequências

- Toda versão em produção tem tag, notas e pacote baixável: a rastreabilidade (PGC 10) parte da Release.
- O rollback (`rollback.yml`) só remarca uma Release antiga como *Latest* e republica o pacote dela, sem rebuild.
- Builds Android/Windows/Linux não são distribuídos por enquanto; se forem, entram como anexos extras da mesma Release (novo ADR).
