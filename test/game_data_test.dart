import 'package:flutter_test/flutter_test.dart';
import 'package:game_tracker/models/game.dart';

void main() {
  test('a biblioteca inicial possui jogos cadastrados', () {
    expect(initialGames, isNotEmpty);
  });
}
