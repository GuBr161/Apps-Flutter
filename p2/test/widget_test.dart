import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:p2/main.dart'; // Substitua "seu_projeto" pelo nome do seu projeto

void main() {
  testWidgets('Teste de Widget MyApp', (WidgetTester tester) async {
    // Constrói nosso widget e aciona uma recriação.
    await tester.pumpWidget(MyApp());

    // Verifica se o widget MyApp foi construído corretamente.
    expect(find.text('Pedra, Papel e Tesoura'), findsOneWidget);
    expect(find.byIcon(Icons.filter_1), findsOneWidget);
    expect(find.byIcon(Icons.filter_2), findsOneWidget);
    expect(find.byIcon(Icons.filter_3), findsOneWidget);
  });
}
