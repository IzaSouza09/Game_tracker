# Game Tracker 🎮

Aplicativo desenvolvido em Flutter para gerenciar e acompanhar a sua biblioteca de jogos, permitindo organizar o progresso, status e favoritos de forma prática.

## 🚀 Funcionalidades

- **Listagem de Jogos:** visualize todos os jogos cadastrados na sua biblioteca.
- **Detalhes do Jogo:** acompanhe status de conclusão, notas e informações detalhadas.
- **Gerenciamento:** adicione, edite ou remova jogos da sua lista pessoal.
- **Filtros e Busca:** encontre rapidamente jogos por status ou título.

## 🛠️ Stack Tecnológica

- **Linguagem/Framework:** [Flutter](https://flutter.dev/) (Dart, SDK `^3.12.2`)
- **Plataformas:** Android, Web, Windows e Linux
- **Gerenciamento de estado:** `setState` (nativo do Flutter)
- **Armazenamento:** em memória (lista `initialGames` em `lib/models/game.dart`)
- **Análise estática:** `flutter_lints` + regras extras em `analysis_options.yaml`

## ▶️ Como instalar e rodar

Pré-requisito: [Flutter SDK](https://docs.flutter.dev/get-started/install) instalado (`flutter doctor` sem erros).

```bash
git clone https://github.com/IzaSouza09/Game_tracker.git
cd Game_tracker
cp .env.example .env     # variáveis de ambiente locais (o .env não vai para o Git)
flutter pub get          # instala as dependências nas versões do pubspec.lock
flutter run              # escolha o dispositivo (Android, Chrome, Windows, Linux)
```

## ✅ Como rodar os testes e a análise

```bash
flutter test      # testes automatizados (pasta test/)
flutter analyze   # análise estática / lints
```

## 🔐 Variáveis de ambiente

Os nomes das variáveis estão em [`.env.example`](.env.example). Hoje o app não consome
nenhuma delas; o arquivo já deixa a estrutura pronta para quando houver API ou backend.
**Nunca** faça commit de chaves reais.

## 🤝 Fluxo de contribuição

A branch `main` é protegida: toda mudança entra por **Pull Request**, com 1 aprovação de
outra pessoa e *squash merge*. Use branches `feature/<issue>-<descricao>` e títulos no padrão
[Conventional Commits](https://www.conventionalcommits.org/pt-br/) (ex.: `feat: adiciona busca por título`).

## 📂 Estrutura de pastas

```text
Game_tracker/
├── .github/              # Template de PR, Issues e CODEOWNERS
├── android/              # Configurações nativas para Android
├── lib/                  # Código principal em Dart
│   ├── models/           # Classes de dados e modelos
│   ├── screens/          # Telas e interfaces de usuário
│   └── main.dart         # Ponto de entrada do aplicativo
├── linux/                # Configurações nativas para Linux
├── test/                 # Testes automatizados
├── web/                  # Versão Web
├── windows/              # Configurações nativas para Windows
├── .env.example          # Modelo de variáveis de ambiente (sem valores reais)
├── pubspec.yaml          # Dependências e assets do projeto
└── pubspec.lock          # Versões exatas das dependências (lockfile)
```
