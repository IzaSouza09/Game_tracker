import 'package:flutter/material.dart';
import '../models/game.dart';
import 'game_list_screen.dart';
import 'statistics_screen.dart';
import 'random_game_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int totalJogos = initialGames.length;
    int totalHoras = initialGames.fold(
      0,
      (soma, jogo) => soma + jogo.horasJogadas,
    );
    double mediaNotas = totalJogos > 0
        ? initialGames.fold(0.0, (soma, jogo) => soma + jogo.nota) / totalJogos
        : 0.0;

    return Scaffold(
      appBar: AppBar(title: const Text('Game Tracker'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Cards de Resumo Estatístico
            Row(
              children: [
                Expanded(
                  child: Card(
                    color: Colors.deepPurple.shade50,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          const Text(
                            'Total de Jogos',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '$totalJogos',
                            style: const TextStyle(
                              fontSize: 24,
                              color: Colors.deepPurple,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    color: Colors.deepPurple.shade50,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          const Text(
                            'Horas Jogadas',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '$totalHoras h',
                            style: const TextStyle(
                              fontSize: 24,
                              color: Colors.deepPurple,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Card(
              color: Colors.deepPurple.shade50,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      'Média das Notas',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      mediaNotas.toStringAsFixed(1),
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),

            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GameListScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.games),
              label: const Text('Ver Lista de Jogos'),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const StatisticsScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.bar_chart),
              label: const Text('Ver Estatísticas'),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RandomGameScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.shuffle),
              label: const Text('O que jogar? (Aleatório)'),
            ),
          ],
        ),
      ),
    );
  }
}
