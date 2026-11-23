// Teste de fumaça (Aula 2): o app abre e o painel mostra os números da
// biblioteca inicial. Se este teste falhar, o app nem inicia direito.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_tracker/main.dart';

void main() {
  // Tela grande o bastante para o painel caber sem overflow.
  void usarTelaGrande(WidgetTester tester) {
    tester.view.physicalSize = const Size(1200, 2400);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);
  }

  testWidgets('o app abre no painel com os totais da biblioteca',
      (WidgetTester tester) async {
    usarTelaGrande(tester);
    await tester.pumpWidget(const GameTrackerApp());

    expect(find.text('Game Tracker'), findsWidgets);
    expect(find.text('Total de Jogos'), findsOneWidget);
    expect(find.text('Horas Jogadas'), findsOneWidget);
    expect(find.text('Média das Notas'), findsOneWidget);

    // 6 jogos; 120+45+60+30+20+2 = 277 h; média 55,7 / 6 = 9,28 -> "9.3"
    expect(find.text('6'), findsWidgets);
    expect(find.text('277 h'), findsOneWidget);
    expect(find.text('9.3'), findsOneWidget);
  });

  testWidgets('o botão "Ver Lista de Jogos" abre outra tela',
      (WidgetTester tester) async {
    usarTelaGrande(tester);
    await tester.pumpWidget(const GameTrackerApp());

    await tester.tap(find.text('Ver Lista de Jogos'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    // O painel saiu da frente: o botão não está mais visível.
    expect(find.text('Ver Lista de Jogos'), findsNothing);
  });

  testWidgets('o botão "Ver Estatísticas" abre outra tela',
      (WidgetTester tester) async {
    usarTelaGrande(tester);
    await tester.pumpWidget(const GameTrackerApp());

    await tester.tap(find.text('Ver Estatísticas'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    expect(find.text('Ver Estatísticas'), findsNothing);
  });
}
