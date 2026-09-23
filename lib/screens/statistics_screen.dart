import 'package:flutter/material.dart';
import '../models/game.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final int totalJogos = initialGames.length;
    final int totalHoras = initialGames.fold(0, (soma, jogo) => soma + jogo.horasJogadas);
    
    // Evita divisão por zero caso a lista esteja vazia
    final double mediaNotas = totalJogos > 0 
        ? initialGames.fold(0.0, (soma, jogo) => soma + jogo.nota) / totalJogos 
        : 0.0;

    final gameMelhorAvaliado = initialGames.isNotEmpty
        ? initialGames.reduce((curr, next) => curr.nota > next.nota ? curr : next)
        : null;

    // Encontrar o jogo com maior número de horas
    final gameMaisJogado = initialGames.isNotEmpty
        ? initialGames.reduce((curr, next) => curr.horasJogadas > next.horasJogadas ? curr : next)
        : null;

    // Maior quantidade de horas para calcular a proporção do gráfico de barras
    final int maxHoras = initialGames.isNotEmpty
        ? initialGames.map((e) => e.horasJogadas).reduce((a, b) => a > b ? a : b)
        : 1;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Estatísticas e Gráficos'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Informações Calculadas (Requisito: pelo menos duas)
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    title: 'Total de Horas',
                    value: '$totalHoras h',
                    icon: Icons.timer,
                    color: Colors.orange,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    title: 'Média das Notas',
                    value: mediaNotas.toStringAsFixed(1),
                    icon: Icons.star,
                    color: Colors.amber,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (gameMelhorAvaliado != null)
              _buildStatCard(
                title: 'Jogo Mais Bem Avaliado',
                value: '${gameMelhorAvaliado.title} (${gameMelhorAvaliado.nota.toStringAsFixed(1)})',
                icon: Icons.emoji_events,
                color: Colors.purple,
              ),
            const SizedBox(height: 12),
            if (gameMaisJogado != null)
              _buildStatCard(
                title: 'Jogo com Maior Nº de Horas',
                value: '${gameMaisJogado.title} (${gameMaisJogado.horasJogadas}h)',
                icon: Icons.local_fire_department,
                color: Colors.red,
              ),
            
            const SizedBox(height: 30),
            const Text(
              'Gráfico: Horas Jogadas por Jogo',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // Gráfico de Barras gerado a partir dos dados reais
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: initialGames.map((game) {
                    // Calcula a porcentagem da barra com base no jogo com mais horas
                    double porcentagem = maxHoras > 0 ? game.horasJogadas / maxHoras : 0.0;
                    
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(game.title, style: const TextStyle(fontWeight: FontWeight.w500)),
                              Text('${game.horasJogadas}h', style: const TextStyle(color: Colors.grey)),
                            ],
                          ),
                          const SizedBox(height: 4),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: LinearProgressIndicator(
                              value: porcentagem,
                              minHeight: 12,
                              backgroundColor: Colors.grey.shade200,
                              valueColor: const AlwaysStoppedAnimation<Color>(Colors.deepPurple),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard({required String title, required String value, required IconData icon, required Color color}) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: color.withOpacity(0.2),
              child: Icon(icon, size: 26, color: color),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 13, color: Colors.grey)),
                  const SizedBox(height: 4),
                  Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}