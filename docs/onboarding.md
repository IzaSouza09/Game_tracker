# Onboarding — Game Tracker

Objetivo (PGC 12): com este guia você consegue abrir seu primeiro Pull Request **sem perguntar nada a ninguém**. Se algo estiver confuso, corrija o guia em um PR `docs: ...`.

PRs recebem resposta em até 3 dias úteis.

## 1. Pré-requisitos

- Conta no GitHub com e-mail verificado e 2FA ativado.
- Acesso de escrita ao repositório (peça para @IzaSouza09 adicionar você em *Collaborators* e aceite o convite em `github.com/notifications`).
- Git e [Flutter SDK](https://docs.flutter.dev/get-started/install) (canal stable). Confira com:

```bash
git --version
flutter --version
flutter doctor
```

No laboratório (Windows) use o **Git Bash**, não o PowerShell. Se a porta 22 (SSH) estiver bloqueada, use sempre a URL `https://`.
Sem Flutter instalado? Dá para fazer tudo pelo site do GitHub: o CI roda os testes para você (veja o passo 6).

## 2. Baixar e instalar

```bash
git clone https://github.com/IzaSouza09/Game_tracker.git
cd Game_tracker
flutter pub get
cp .env.example .env     # opcional: o app ainda não lê variáveis
```

## 3. Executar

```bash
flutter run -d chrome    # ou -d windows, -d linux, ou um emulador Android
```

O app abre no painel com **Total de Jogos**, **Horas Jogadas** e **Média das Notas**.

## 4. Rodar lint e testes (o mesmo que o CI)

```bash
flutter analyze --no-fatal-infos
flutter test --coverage
bash scripts/cobertura.sh 60
```

Os testes ficam em `test/`. Ao mudar regras em `lib/models/`, atualize `test/biblioteca_test.dart`.

## 5. Criar a branch da sua tarefa

1. Escolha ou crie uma Issue (**Issues → New issue → Funcionalidade** ou **Defeito**). Anote o número, ex.: `#12`.
2. Crie a branch a partir da `main` atualizada:

```bash
git switch main
git pull
git switch -c feature/12-filtro-por-plataforma
```

Padrão: `feature/<nº da issue>-<descricao-curta>`; correção de produção: `revert/<descricao>`.

## 6. Commit, push e Pull Request

```bash
git add .
git commit -m "feat(telas): adiciona filtro por plataforma"
git push -u origin feature/12-filtro-por-plataforma
```

No GitHub, clique em **Compare & pull request**:

- **Título** em Conventional Commits: `<tipo>(<escopo>): <descrição>`. Tipos: `feat`, `fix`, `docs`, `style`, `refactor`, `perf`, `test`, `build`, `ci`, `chore`, `revert`. Escopo em minúsculas (ex.: `telas`, `modelos`).
  - `feat` gera versão minor, `fix` gera patch, `docs`/`chore`/`ci` não geram versão.
- **Descrição:** preencha o template e mantenha `Closes #12`.
- **Reviewers:** peça revisão da sua dupla.

Pelo site (sem Git local): abra o arquivo, clique no lápis, edite e escolha *Create a new branch for this commit and start a pull request*.

## 7. Ler o resultado do pipeline

Na aba **Checks** do PR:

| Check | O que verifica | Se falhar |
|---|---|---|
| `titulo-pr` | Título no padrão Conventional Commits | Edite o título do PR |
| `qualidade` | `flutter analyze`, testes, cobertura ≥ 60%, build web | Abra o log, corrija na mesma branch e dê push |
| `dependencias` | Vulnerabilidade crítica em dependência nova | Troque a versão do pacote |
| `ci-ok` | Resumo: verde só se nada falhou | Veja qual job acima falhou |

Com `ci-ok` e `titulo-pr` verdes e 1 aprovação, use **Squash and merge**. A branch é apagada sozinha.

## 8. Depois do merge

O workflow **CD** (aba *Actions*) calcula a versão, gera o pacote e publica em `staging`. A produção só sai depois que a Desenvolvedora Líder aprova o job **Produção**; então aparece uma nova Release em **Releases**.

Problema em produção? A líder roda **Actions → Rollback** com a tag anterior, e a correção entra na `main` por PR.
