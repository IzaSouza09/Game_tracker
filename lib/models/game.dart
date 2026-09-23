class Game {
  final String title;
  final String genre;
  final String platform;
  final String descricao;
  int horasJogadas;
  double nota;

  Game({
    required this.title,
    required this.genre,
    required this.platform,
    required this.descricao,
    required this.horasJogadas,
    required this.nota,
  });
}

List<Game> initialGames = [
  Game(
    title: 'The Witcher 3',
    genre: 'RPG',
    platform: 'PC',
    descricao: 'Um RPG de mundo aberto focado em narrativa.',
    horasJogadas: 120,
    nota: 9.8,
  ),
  Game(
    title: 'God of War',
    genre: 'Ação/Aventura',
    platform: 'PlayStation',
    descricao: 'Jornada épica de Kratos e Atreus na mitologia nórdica.',
    horasJogadas: 45,
    nota: 9.5,
  ),
  Game(
    title: 'Hades',
    genre: 'Roguelike',
    platform: 'PC',
    descricao: 'Tente escapar do Submundo do deus grego dos mortos.',
    horasJogadas: 60,
    nota: 9.2,
  ),
  Game(
    title: 'Minecraft',
    genre: 'Sandbox',
    platform: 'Multiplatform',
    descricao: 'Construa, explore e sobreviva em mundos infinitos de blocos.',
    horasJogadas: 30,
    nota: 8.5,
  ),
  Game(
    title: 'Elden Ring',
    genre: 'Soulslike',
    platform: 'PC',
    descricao: 'Um vasto RPG de ação em um mundo criado por Hidetaka Miyazaki e George R. R. Martin.',
    horasJogadas: 20,
    nota: 9.7,
  ),
  Game(
    title: 'Celeste',
    genre: 'Plataforma',
    platform: 'Nintendo Switch',
    descricao: 'Ajude Madeline a sobreviver aos seus demônios internos em sua jornada até o topo da Montanha Celeste.',
    horasJogadas: 2,
    nota: 9.0,
  ),
];