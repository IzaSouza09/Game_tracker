# Game Tracker 🎮

Aplicativo em Flutter para gerenciar e acompanhar a sua biblioteca de jogos: horas jogadas, nota e estatísticas da coleção.

---

## 🚀 Funcionalidades

- **Painel (Dashboard):** total de jogos, total de horas jogadas e média das notas.
- **Lista de Jogos:** todos os jogos da biblioteca com gênero, plataforma e descrição.
- **Estatísticas:** visão consolidada da coleção.
- **O que jogar?:** sorteia um jogo da biblioteca.

---

## 🛠️ Stack

| Item | Escolha |
|---|---|
| Linguagem / framework | Dart (SDK `^3.12.2`) + Flutter (canal stable) |
| Gerenciamento de estado | Widgets do Flutter (`StatelessWidget` / `setState`) |
| Dados | Em memória: lista `initialGames` em `lib/models/game.dart` |
| Lint | `flutter_lints` + regras estritas em `analysis_options.yaml` |
| Testes | `flutter_test` (testes de widget e de regra de negócio) |
| CI/CD | GitHub Actions (`.github/workflows/`) |
| Plataformas | Android, Web, Windows, Linux |

---

## ▶️ Como instalar e executar

Pré-requisitos: [Flutter SDK](https://docs.flutter.dev/get-started/install) (canal stable) e Git.

```bash
git clone https://github.com/IzaSouza09/Game_tracker.git
cd Game_tracker
flutter pub get          # instala as dependências exatas do pubspec.lock
flutter run -d chrome    # ou: -d windows | -d linux | -d <id do emulador Android>
```

Variáveis de ambiente: copie `.env.example` para `.env` (o `.env` não vai para o Git). Hoje o app não lê nenhuma variável.

## ✅ Como rodar lint e testes

```bash
flutter analyze --no-fatal-infos     # lint (o mesmo que o CI roda)
flutter test --coverage              # testes + cobertura em coverage/lcov.info
bash scripts/cobertura.sh 60         # confere a cobertura mínima (Git Bash no Windows)
flutter build web                    # build de produção em build/web
```

---

## 🔁 Fluxo de trabalho (PGC)

- `main` é protegida: toda mudança entra por **Pull Request** revisado pelo par.
- Branch: `feature/<nº da issue>-<descricao>` (ex.: `feature/3-ci`).
- Título do PR em **Conventional Commits** (`feat(telas): ...`, `fix(modelos): ...`, `docs: ...`). O título vira o commit na `main` e define a próxima versão.
- Merge somente por **Squash and merge**.
- Guia completo para quem chega: [`docs/onboarding.md`](docs/onboarding.md).

---

## 📂 Estrutura de pastas

```text
Game_tracker/
├── .github/              # Workflows de CI/CD, templates de PR e Issues, CODEOWNERS, Dependabot
├── android/              # Configurações nativas para Android
├── docs/                 # Onboarding, ADRs e rastreabilidade
├── lib/                  # Código principal em Dart (Flutter)
│   ├── models/           # Classes de dados (Game) e lista inicial
│   ├── screens/          # Telas (dashboard, lista, estatísticas, aleatório)
│   └── main.dart         # Ponto de entrada do aplicativo
├── linux/                # Configurações nativas para Linux
├── scripts/              # Cobertura mínima e cálculo de versão
├── test/                 # Testes automatizados
├── web/                  # Configurações para a versão Web
├── windows/              # Configurações nativas para Windows
├── .env.example          # Nomes das variáveis de ambiente (sem valores)
├── analysis_options.yaml # Regras de lint
├── pubspec.yaml          # Dependências e assets do projeto
└── pubspec.lock          # Versões exatas das dependências (lockfile)
```
