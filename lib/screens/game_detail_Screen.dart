import 'package:flutter/material.dart';
import '../models/game.dart';

class GameDetailScreen extends StatefulWidget {
  final Game game;

  const GameDetailScreen({super.key, required this.game});

  @override
  State<GameDetailScreen> createState() => _GameDetailScreenState();
}

class _GameDetailScreenState extends State<GameDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.game.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.deepPurple.shade100,
                child: const Icon(Icons.videogame_asset, size: 60, color: Colors.deepPurple),
              ),
            ),
            const SizedBox(height: 20),
            Text(widget.game.title, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Gênero: ${widget.game.genre}', style: const TextStyle(fontSize: 16, color: Colors.grey)),
            Text('Plataforma: ${widget.game.platform}', style: const TextStyle(fontSize: 16, color: Colors.grey)),
            const SizedBox(height: 12),
            const Text('Descrição:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(widget.game.descricao, style: const TextStyle(fontSize: 15)),
            const Divider(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Horas Jogadas: ${widget.game.horasJogadas}h', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (widget.game.horasJogadas > 0) {
                            widget.game.horasJogadas--;
                          }
                        });
                      },
                      icon: const Icon(Icons.remove_circle, color: Colors.red, size: 30),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          widget.game.horasJogadas++;
                        });
                      },
                      icon: const Icon(Icons.add_circle, color: Colors.green, size: 30),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Avaliação: ${widget.game.nota.toStringAsFixed(1)} / 10', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (widget.game.nota > 0.0) {
                            widget.game.nota = (widget.game.nota - 0.5).clamp(0.0, 10.0);
                          }
                        });
                      },
                      icon: const Icon(Icons.remove_circle, color: Colors.red, size: 30),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (widget.game.nota < 10.0) {
                            widget.game.nota = (widget.game.nota + 0.5).clamp(0.0, 10.0);
                          }
                        });
                      },
                      icon: const Icon(Icons.add_circle, color: Colors.green, size: 30),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}