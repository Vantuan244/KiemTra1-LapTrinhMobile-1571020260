import 'package:flutter/material.dart';
import 'dart:math';
void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String displayValue = '0';
  double operand1 = 0.0;
  double operand2 = 0.0;
  String operation = '';
  bool shouldResetDisplay = false;

void handleButtonPress(String value) {
  setState(() {
    if (value == 'C') {
      clear();
    } else if (value == 'CE') {
      clearEntry();
    } else if (value == '=') {
      calculate();
    } else if (value == '+' || value == '-' || value == '*' || value == '/') {
      handleOperation(value);
    } else if (value == '⌫') {
      deleteDigit();
    } else if (value == '%') {
      applyPercentage();
    } else if (value == 'x²') {
      square();
    } else if (value == '√') {
      squareRoot();
    } else if (value == 'log') {
      logarithm();
    } else if (value == '+/-') {
      negate();
    } else {
      handleDigit(value);
    }
  });
}

void square() {
  if (!shouldResetDisplay) {
    double currentValue = double.parse(displayValue);
    displayValue = (currentValue * currentValue).toString();
  }
}

void squareRoot() {
  if (!shouldResetDisplay) {
    double currentValue = double.parse(displayValue);
    if (currentValue >= 0) {
      displayValue = (sqrt(currentValue)).toString();
    } else {
      displayValue = 'ERROR';
    }
  }
}

void logarithm() {
  if (!shouldResetDisplay) {
    double currentValue = double.parse(displayValue);
    if (currentValue > 0) {
      displayValue = (log(currentValue)).toString();
    } else {
      displayValue = 'ERROR';
    }
  }
}

void negate() {
  if (!shouldResetDisplay) {
    double currentValue = double.parse(displayValue);
    displayValue = (-currentValue).toString();
  }
}

void applyPercentage() {
  if (!shouldResetDisplay) {
    // Convert the current display value to a percentage
    double currentValue = double.parse(displayValue);
    double percentageValue = currentValue / 100.0;
    displayValue = percentageValue.toString();
  }
}

void clearEntry() {
  displayValue = '0';
}

void deleteDigit() {
  if (!shouldResetDisplay) {
    // If the display is not set to reset, remove the last digit
    displayValue = displayValue.substring(0, displayValue.length - 1);
    if (displayValue.isEmpty) {
      displayValue = '0';
    }
  }
}

  void clear() {
    displayValue = '0';
    operand1 = 0.0;
    operand2 = 0.0;
    operation = '';
    shouldResetDisplay = false;
  }

  void calculate() {
    if (operation.isNotEmpty && displayValue != 'ERROR') {
      try {
        operand2 = double.parse(displayValue);
        switch (operation) {
          case '+':
            displayValue = (operand1 + operand2).toString();
            break;
          case '-':
            displayValue = (operand1 - operand2).toString();
            break;
          case '*':
            displayValue = (operand1 * operand2).toString();
            break;
          case '/':
            if (operand2 != 0) {
              displayValue = (operand1 / operand2).toString();
            } else {
              displayValue = 'ERROR';
            }
            break;
        }
      } catch (e) {
        displayValue = 'ERROR';
      }
      operand1 = 0.0;
      operand2 = 0.0;
      operation = '';
      shouldResetDisplay = true;
    }
  }

void handleOperation(String value) {
  if (operation.isNotEmpty && !shouldResetDisplay) {
    // If there is an ongoing operation and the display is not reset,
    // calculate the result with the existing operands and update the display
    calculate();
  } else {
    operand1 = double.parse(displayValue);
  }

  operation = value;
  shouldResetDisplay = true;
}

void handleDigit(String value) {
  if (shouldResetDisplay) {
    displayValue = '0';
    shouldResetDisplay = false;
  }

  // Check if the current display value is '0' and the pressed value is not '.'
  if (displayValue == '0' && value != '.') {
    displayValue = value;
  } else {
    // Concatenate the pressed value to the current display value
    displayValue += value;
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              displayValue,
              style: TextStyle(fontSize: 32),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
          CalculatorButton('C', handleButtonPress ),  //1571020260
          CalculatorButton('CE', handleButtonPress ),  //1571020260
          CalculatorButton('%', handleButtonPress ),  //1571020260
          CalculatorButton('⌫', handleButtonPress ),  //1571020260
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
          CalculatorButton('x²', handleButtonPress ),  //1571020260
          CalculatorButton('√', handleButtonPress ),  //1571020260
          CalculatorButton('log', handleButtonPress ),  //1571020260
          CalculatorButton('+/-', handleButtonPress ),  //1571020260
            ],
          ),
         Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CalculatorButton('7', handleButtonPress ),  //1571020260
          CalculatorButton('8', handleButtonPress ),  //1571020260
          CalculatorButton('9', handleButtonPress ),  //1571020260
          CalculatorButton('/', handleButtonPress ),  //1571020260
        ],
      ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorButton('4', handleButtonPress ),  //1571020260
              CalculatorButton('5', handleButtonPress ),  //1571020260
              CalculatorButton('6', handleButtonPress ),  //1571020260
              CalculatorButton('*', handleButtonPress ),  //1571020260
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorButton('1', handleButtonPress ),  //1571020260
              CalculatorButton('2', handleButtonPress ),  //1571020260
              CalculatorButton('3', handleButtonPress ),  //1571020260
              CalculatorButton('-', handleButtonPress ),  //1571020260
            ],
          ),
          Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
         
          CalculatorButton('0', handleButtonPress ),  //1571020260
          CalculatorButton('.', handleButtonPress ),  //1571020260
          CalculatorButton('=', handleButtonPress ),  //1571020260
          CalculatorButton('+', handleButtonPress ),  //1571020260
            ],
          ),
        ],
      ),
    );
  }
}

class CalculatorButton extends StatelessWidget {
  final String value;
  final Function(String) onPressed;

  CalculatorButton(this.value, this.onPressed);

 @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: ElevatedButton(
        onPressed: () => onPressed(value),
        child: Text(
          value,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
