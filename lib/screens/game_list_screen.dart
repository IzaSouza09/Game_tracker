import 'package:flutter/material.dart';
import '../models/game.dart';
import 'game_detail_screen.dart';

class GameListScreen extends StatefulWidget {
  const GameListScreen({super.key});

  @override
  State<GameListScreen> createState() => _GameListScreenState();
}

class _GameListScreenState extends State<GameListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Jogos'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: initialGames.length,
        itemBuilder: (context, index) {
          final game = initialGames[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            elevation: 3,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.deepPurple.shade100,
                child: Text(
                  game.nota.toStringAsFixed(0),
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple),
                ),
              ),
              title: Text(
                game.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('${game.genre} • ${game.platform}'),
              trailing: Text('${game.horasJogadas}h'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GameDetailScreen(game: game),
                  ),
                ).then((_) {
                  setState(() {}); // Atualiza a lista ao voltar dos detalhes
                });
              },
            ),
          );
        },
      ),
    );
  }
}