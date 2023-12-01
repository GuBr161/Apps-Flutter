import 'package:flutter/material.dart';

void main() {
  runApp(CalculadoraApp());
}

class CalculadoraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculadoraHomePage(),
    );
  }
}

class CalculadoraHomePage extends StatefulWidget {
  @override
  _CalculadoraHomePageState createState() => _CalculadoraHomePageState();
}

class _CalculadoraHomePageState extends State<CalculadoraHomePage> {
  String displayText = '';
  double? firstOperand;
  String? operation;

  void _onDigitPressed(String digit) {
    setState(() {
      displayText += digit;
    });
  }

  void _onOperationPressed(String newOperation) {
    setState(() {
      firstOperand = double.parse(displayText);
      operation = newOperation;
      displayText = '';
    });
  }

  void _onEqualsPressed() {
    setState(() {
      if (operation != null && displayText.isNotEmpty) {
        double secondOperand = double.parse(displayText);
        switch (operation) {
          case '+':
            displayText = (firstOperand! + secondOperand).toString();
            break;
          case '-':
            displayText = (firstOperand! - secondOperand).toString();
            break;
          case '*':
            displayText = (firstOperand! * secondOperand).toString();
            break;
          case '/':
            displayText = (firstOperand! / secondOperand).toString();
            break;
        }
        // Limpar os operadores após a conclusão da operação
        firstOperand = null;
        operation = null;
      }
    });
  }

  void _onClearPressed() {
    setState(() {
      displayText = '';
      firstOperand = null;
      operation = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora Flutter'),
      ),
      body: Container(
        color: Colors.grey[800],
        padding: EdgeInsets.all(16.0),
        child: Container(
          color: Colors.grey[400],
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  displayText,
                  style: TextStyle(
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                margin: EdgeInsets.symmetric(vertical: 5.0),
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        _buildCalcButton('7'),
                        _buildCalcButton('8'),
                        _buildCalcButton('9'),
                        _buildOperationButton('/'),
                      ],
                    ),
                    SizedBox(height: 5.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        _buildCalcButton('4'),
                        _buildCalcButton('5'),
                        _buildCalcButton('6'),
                        _buildOperationButton('*'),
                      ],
                    ),
                    SizedBox(height: 5.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        _buildCalcButton('1'),
                        _buildCalcButton('2'),
                        _buildCalcButton('3'),
                        _buildOperationButton('-'),
                      ],
                    ),
                    SizedBox(height: 5.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        _buildCalcButton('0'),
                        _buildCalcButton('.'),
                        _buildEqualsButton(),
                        _buildOperationButton('+'),
                      ],
                    ),
                    SizedBox(height: 5.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        _buildClearButton(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCalcButton(String text) {
    return Container(
      width: 50.0,
      height: 50.0,
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      child: ElevatedButton(
        onPressed: () => _onDigitPressed(text),
        style: ElevatedButton.styleFrom(
          primary: Colors.grey[300], // Cor de fundo do botão
          onPrimary: Colors.black, // Cor do texto do botão
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: Colors.black), // Cor da borda do botão
          ),
        ),
        child: Text(text, style: TextStyle(fontSize: 24.0)),
      ),
    );
  }

  Widget _buildOperationButton(String text) {
    return Container(
      width: 50.0,
      height: 50.0,
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      child: ElevatedButton(
        onPressed: () => _onOperationPressed(text),
        style: ElevatedButton.styleFrom(
          primary: Colors.grey[300],
          onPrimary: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: Colors.black),
          ),
        ),
        child: Text(text, style: TextStyle(fontSize: 24.0)),
      ),
    );
  }

  Widget _buildEqualsButton() {
    return Container(
      width: 50.0,
      height: 50.0,
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      child: ElevatedButton(
        onPressed: _onEqualsPressed,
        style: ElevatedButton.styleFrom(
          primary: Colors.grey[300],
          onPrimary: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: Colors.black),
          ),
        ),
        child: Text('=', style: TextStyle(fontSize: 24.0)),
      ),
    );
  }

  Widget _buildClearButton() {
    return Container(
      width: 50.0,
      height: 50.0,
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      child: ElevatedButton(
        onPressed: _onClearPressed,
        style: ElevatedButton.styleFrom(
          primary: Colors.grey[300],
          onPrimary: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: Colors.black),
          ),
        ),
        child: Text('C', style: TextStyle(fontSize: 24.0)),
      ),
    );
  }
}
