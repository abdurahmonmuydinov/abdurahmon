import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  String _output = "0";
  String _input = "";
  double num1 = 0;
  double num2 = 0;
  String operand = "";
  late Timer _timer;
  DateTime _currentDateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _currentDateTime = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        _input = "";
        _output = "0";
        num1 = 0;
        num2 = 0;
        operand = "";
      } else if (buttonText == "=") {
        num2 = double.parse(_input);
        if (operand == "+") {
          _output = (num1 + num2).toString();
        } else if (operand == "-") {
          _output = (num1 - num2).toString();
        } else if (operand == "*") {
          _output = (num1 * num2).toString();
        } else if (operand == "/") {
          _output = (num1 / num2).toString();
        }
        _input = "";
        num1 = 0;
        num2 = 0;
        operand = "";
      } else if (["+", "-", "*", "/"].contains(buttonText)) {
        num1 = double.parse(_input);
        operand = buttonText;
        _input = "";
      } else {
        _input += buttonText;
        _output = _input;
      }
    });
  }

  Widget buildButton(String buttonText) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () => buttonPressed(buttonText),
        child: Text(buttonText, style: TextStyle(fontSize: 24)),
      ),
    );
  }

  void showDateTimeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            Timer.periodic(Duration(seconds: 1), (timer) {
              setState(() {
                _currentDateTime = DateTime.now();
              });
            });
            return AlertDialog(
              title: Text("Soat"),
              content: Text("Yil: ${_currentDateTime.year}\n" +
                  "Oy: ${_currentDateTime.month}\n" +
                  "Kun: ${_currentDateTime.day}\n" +
                  "Soat: ${_currentDateTime.hour}:${_currentDateTime.minute}:${_currentDateTime.second}"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Yopish"),
                )
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kalkulyator"),
        actions: [
          IconButton(
            onPressed: () => showDateTimeDialog(context),
            icon: Icon(Icons.add_alarm_sharp),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(_output,
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
            ),
          ),
          Expanded(child: Divider()),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildButton("7"),
                  buildButton("8"),
                  buildButton("9"),
                  buildButton("/")
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildButton("4"),
                  buildButton("5"),
                  buildButton("6"),
                  buildButton("*")
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildButton("1"),
                  buildButton("2"),
                  buildButton("3"),
                  buildButton("-")
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildButton("C"),
                  buildButton("0"),
                  buildButton("="),
                  buildButton("+")
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
