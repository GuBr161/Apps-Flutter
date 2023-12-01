import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String escolhaUsuario = '';
  String escolhaComputador = '';
  String resultado = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pedra, Papel e Tesoura'),
        ),
        body: Container(
          color: Color.fromARGB(255, 238, 238, 238), // Cor cinza
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Faça sua Escolha',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildIconButton(Icons.crop_square, 'Pedra'),
                    buildIconButton(Icons.pan_tool, 'Papel'),
                    buildIconButton(Icons.content_cut, 'Tesoura'),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'Usuário: $escolhaUsuario',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 20),
                Text(
                  'Computador: $escolhaComputador',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 20),
                Text(
                  'Vencedor: $resultado',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: resultado == '' ? Colors.black : getCorResultado(),
                  ),
                ),
                SizedBox(height: 20),
                if (resultado != '') getIconeResultado(),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: reiniciarJogo,
                  child: Text(
                    'Reiniciar',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildIconButton(IconData icon, String escolha) {
    return IconButton(
      icon: Icon(icon),
      iconSize: 80,
      onPressed: escolhaUsuario.isEmpty
          ? () {
              // Permite que o usuário escolha somente uma opção
              atualizarEscolhas(escolha);
            }
          : null,
    );
  }

  Color getCorResultado() {
    if (resultado == 'Empate') {
      return Colors.amber;
    } else if (resultado == 'Computador') {
      return Colors.red;
    } else {
      return Colors.green;
    }
  }

  Widget getIconeResultado() {
    IconData icone;
    Color cor;

    if (resultado == 'Empate') {
      icone = Icons.sentiment_neutral;
      cor = Colors.amber;
    } else if (resultado == 'Computador') {
      icone = Icons.sentiment_very_dissatisfied;
      cor = Colors.red;
    } else {
      icone = Icons.sentiment_very_satisfied;
      cor = Colors.green;
    }

    return Icon(
      icone,
      size: 60,
      color: cor,
    );
  }

  void atualizarEscolhas(String escolhaUsuario) {
    // Atualiza a escolha do usuário
    setState(() {
      this.escolhaUsuario = escolhaUsuario;

      // Escolha aleatória do computador
      var random = Random();
      int escolhaAleatoria = random.nextInt(3);

      switch (escolhaAleatoria) {
        case 0:
          escolhaComputador = 'Papel';
          break;
        case 1:
          escolhaComputador = 'Pedra';
          break;
        case 2:
          escolhaComputador = 'Tesoura';
          break;
        default:
          escolhaComputador = '';
      }

      // Determina o vencedor
      if (escolhaUsuario == escolhaComputador) {
        resultado = 'Empate';
      } else if ((escolhaUsuario == 'Pedra' &&
              escolhaComputador == 'Tesoura') ||
          (escolhaUsuario == 'Papel' && escolhaComputador == 'Pedra') ||
          (escolhaUsuario == 'Tesoura' && escolhaComputador == 'Papel')) {
        resultado = 'Usuário';
      } else {
        resultado = 'Computador';
      }
    });
  }

  void reiniciarJogo() {
    setState(() {
      escolhaUsuario = '';
      escolhaComputador = '';
      resultado = '';
    });
  }
}
