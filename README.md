# Game Tracker 🎮

Aplicativo desenvolvido em Flutter para gerenciar e acompanhar a sua biblioteca de jogos, permitindo organizar o progresso, status e favoritos de forma prática.

---

## 🚀 Funcionalidades

- **Listagem de Jogos:** Visualize todos os jogos cadastrados na sua biblioteca.
- **Detalhes do Jogo:** Acompanhe status de conclusão, notas e informações detalhadas.
- **Gerenciamento:** Adicione, edite ou remova jogos da sua lista pessoal.
- **Filtros e Busca:** Encontre rapidamente jogos por status ou título.

---

## 🛠️ Stack Tecnológica

- **Frontend/Mobile:** [Flutter](https://flutter.dev/) (Dart)
- **Gerenciamento de Estado:** *(Ex: Provider / GetX / setState — ajuste conforme o seu)*
- **Armazenamento:** *(Ex: SharedPreferences / SQLite / Firebase — ajuste conforme o seu)*

---

## 📂 Estrutura de Pastas

A estrutura do projeto está organizada da seguinte forma:

```text
game_tracker/
├── .github/              # Modelos de Pull Request, Issues e CODEOWNERS
├── android/              # Configurações nativas para Android
├── lib/                  # Código principal em Dart (Flutter)
│   ├── models/           # Classes de dados e modelos da aplicação
│   ├── screens/          # Telas e interfaces de usuário
│   └── main.dart         # Ponto de entrada do aplicativo
├── linux/                # Configurações nativas para Linux
├── web/                  # Configurações para a versão Web
├── windows/              # Configurações nativas para Windows
├── pubspec.yaml          # Dependências e assets do projeto
└── pubspec.lock          # Versões exatas das dependências (Lockfile)
