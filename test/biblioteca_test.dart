// Testes de regra de negócio da biblioteca de jogos (Aula 2).
import 'package:flutter_test/flutter_test.dart';
import 'package:game_tracker/models/game.dart';

void main() {
  group('Biblioteca inicial', () {
    test('tem 6 jogos', () {
      expect(initialGames.length, 6);
    });

    test('não tem títulos repetidos', () {
      final titulos = initialGames.map((jogo) => jogo.title).toSet();
      expect(titulos.length, initialGames.length);
    });

    test('toda nota fica entre 0 e 10', () {
      for (final jogo in initialGames) {
        expect(jogo.nota, inInclusiveRange(0, 10), reason: jogo.title);
      }
    });

    test('nenhum jogo tem horas negativas', () {
      for (final jogo in initialGames) {
        expect(jogo.horasJogadas, greaterThanOrEqualTo(0), reason: jogo.title);
      }
    });

    test('total de horas jogadas é 277', () {
      final total =
          initialGames.fold<int>(0, (soma, jogo) => soma + jogo.horasJogadas);
      expect(total, 278);
    });

    test('média das notas é 9,28', () {
      final somaNotas =
          initialGames.fold<double>(0, (soma, jogo) => soma + jogo.nota);
      expect(somaNotas / initialGames.length, closeTo(9.28, 0.01));
    });
  });

  group('Game', () {
    test('permite atualizar horas jogadas e nota', () {
      final jogo = Game(
        title: 'Teste',
        genre: 'Puzzle',
        platform: 'PC',
        descricao: 'Jogo de teste',
        horasJogadas: 1,
        nota: 7.0,
      );

      jogo.horasJogadas += 2;
      jogo.nota = 8.5;

      expect(jogo.horasJogadas, 3);
      expect(jogo.nota, 8.5);
    });
  });
}
