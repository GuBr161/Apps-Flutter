import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login/main.dart'; // Certifique-se de importar o arquivo principal do seu aplicativo

void main() {
  testWidgets('Teste de tela de login', (WidgetTester tester) async {
    // Construa o widget do aplicativo e acione um frame.
    await tester.pumpWidget(LoginApp());

    // Verifique se os campos de nome de usuário e senha estão presentes
    expect(find.byKey(Key('username_field')), findsOneWidget);
    expect(find.byKey(Key('password_field')), findsOneWidget);

    // Insira algum texto nos campos
    await tester.enterText(find.byKey(Key('username_field')), 'usuario');
    await tester.enterText(find.byKey(Key('password_field')), 'senha');

    // Clique no botão de login
    await tester.tap(find.byKey(Key('login_button')));

    await tester.pump();

    // Verifique se a mensagem de autenticação bem-sucedida é exibida
    expect(find.text('Autenticado com sucesso!'), findsOneWidget);
  });
}
