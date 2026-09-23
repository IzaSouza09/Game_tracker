import 'dart:math';
import 'package:flutter/material.dart';
import '../models/game.dart';

class RandomGameScreen extends StatefulWidget {
  const RandomGameScreen({super.key});

  @override
  State<RandomGameScreen> createState() => _RandomGameScreenState();
}

class _RandomGameScreenState extends State<RandomGameScreen> {
  Game? _jogoSorteado;

  void _sortearJogo() {
    final random = Random();
    setState(() {
      int index = random.nextInt(initialGames.length);
      _jogoSorteado = initialGames[index];
    });
  }

  @override
  void initState() {
    super.initState();
    _sortearJogo(); // Sorteia o primeiro jogo ao abrir a tela
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('O que jogar?'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Sugestão para hoje:',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              if (_jogoSorteado != null)
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Imagem (Ícone representativo já que usamos objetos locais)
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.deepPurple.shade100,
                          child: const Icon(Icons.sports_esports, size: 45, color: Colors.deepPurple),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          _jogoSorteado!.title,
                          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Gênero: ${_jogoSorteado!.genre}',
                          style: const TextStyle(fontSize: 16, color: Colors.black87),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Plataforma: ${_jogoSorteado!.platform}',
                          style: const TextStyle(fontSize: 16, color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: _sortearJogo,
                icon: const Icon(Icons.shuffle),
                label: const Text('Sortear Outro Jogo'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}