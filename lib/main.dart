import 'package:flutter/material.dart';
import 'package:expressions/expressions.dart';

void main() {
  runApp(Calculator());
}

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'A Simple Calculator',
      theme: ThemeData(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[900],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[900],
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _display = "0";
  String _expression = "";

  void _onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        _display = "0";
        _expression = "";
      } else if (buttonText == "=") {
        try {
          Expression expression = Expression.parse(_expression);
          final evaluator = const ExpressionEvaluator();
          var result = evaluator.eval(expression, {});
          _display = result.toString();
          _expression = _display;
        } catch (e) {
          _display = "Error";
        }
      } else if (buttonText == "X") {
        if (_expression.isNotEmpty) {
          _expression = _expression.substring(0, _expression.length - 1);
          _display = _expression.isEmpty ? "0" : _expression;
        }
      } else {
        _expression += buttonText;
        _display = _expression;
      }
    });
  }

  Widget _buildButton(String buttonText, {Color color = Colors.white}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: OutlinedButton(
          onPressed: () => _onButtonPressed(buttonText),
          style: OutlinedButton.styleFrom(
            foregroundColor: color,
            backgroundColor: Colors.grey[800],
            side: BorderSide(color: color, width: 1),
            padding: buttonText == "X" ? EdgeInsets.all(24.0) : EdgeInsets.all(16.0),
            textStyle: TextStyle(
              fontSize: buttonText == "X" ? 20.0 : 24.0,
              fontWeight: buttonText == "X" ? FontWeight.normal : FontWeight.bold,
              fontFamily: 'Roboto',
            ),
          ),
          child: Text(
            buttonText,
            style: TextStyle(fontSize: buttonText == "X" ? 20.0 : 24.0),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        centerTitle: true,
      ),
      body: 
          Container(
            padding: EdgeInsets.only(top: 64.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: Container(
                    alignment: Alignment.bottomRight,
                    padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
                    child: Text(
                      _display,
                      style: TextStyle(
                        fontSize: 48.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildButton("7"),
                          _buildButton("8"),
                          _buildButton("9"),
                          _buildButton("/", color: Colors.white),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildButton("4"),
                          _buildButton("5"),
                          _buildButton("6"),
                          _buildButton("*", color: Colors.white),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildButton("1"),
                          _buildButton("2"),
                          _buildButton("3"),
                          _buildButton("-", color: Colors.white),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildButton(".", color: Colors.white),
                          _buildButton("0"),
                          _buildButton("+", color: Colors.white),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildButton("C", color: Colors.red),
                          _buildButton("=", color: Colors.green),
                          _buildButton("X"),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
             ),
      ),
    );
          
      
    
  }
}
