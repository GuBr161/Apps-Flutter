import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:calculadora/main.dart'; // Ajuste o caminho conforme necessário

void main() {
  testWidgets('Teste do Widget Calculadora', (WidgetTester tester) async {
    // Construa o widget principal.
    await tester.pumpWidget(CalculadoraApp());

    // Encontre o widget CalculadoraHomePage usando seu tipo.
    final calculadoraHomePageFinder = find.byType(CalculadoraHomePage);
    expect(calculadoraHomePageFinder, findsOneWidget);

    // Verifique se o texto inicial está presente.
    expect(find.text(''), findsOneWidget);

    // Execute ações de teste, por exemplo, pressionar botões e verificar o resultado.
    await tester.tap(find.text('1'));
    await tester.pump();
    expect(find.text('1'), findsOneWidget);

    // Adicione mais testes conforme necessário.
  });
}
