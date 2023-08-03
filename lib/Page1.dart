import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});
  @override
  State<Page1> createState() => _Page1State();
}
class _Page1State extends State<Page1> {
  String _storedValue = '';
  String _operation = '';
  int _num1 = 0;
  int _num2 = 0;
  int _result = 0;

  void _calculateResult() {
    switch (_operation) {
      case '+':
        _result = _num1 + _num2;
        break;
      case '-':
        _result = _num1 - _num2;
        break;
      case '*':
        _result = _num1 * _num2;
        break;
      case '/':
        _result = _num1 ~/ _num2; // Use integer division for int results
        break;
      default:
        _result = 0;
    }

    _storedValue = _result.toString();
    _num1 = _result;
  }

  void _onOperationButtonPressed(String operation) {
    if (_operation.isNotEmpty && _num2 != 0) {
      _calculateResult();
    }

    _operation = operation;
    _storedValue = '';
  }

  void _onEqualsButtonPressed() {
    if (_operation.isNotEmpty) {
      _calculateResult();
      _operation = '';
      _num2 = 0;
    }
  }

  void _onNumberButtonPressed(int number) {
    setState(() {
      if (_operation.isEmpty) {
        _num1 = _num1 * 10 + number;
        _storedValue = _num1.toString();
      } else {
        _num2 = _num2 * 10 + number;
        _storedValue = _num2.toString();
      }
    });
  }

  void _onClearButtonPressed() {
    setState(() {
      _num1 = 0;
      _num2 = 0;
      _result = 0;
      _operation = '';
      _storedValue = '';
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: 1000,
        width: double.maxFinite,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 48.0),
              child: Container(
                height: 200,
                width: double.maxFinite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 60.0, right: 8),
                      child: Text(
                        _storedValue,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 45,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.maxFinite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: double.maxFinite,
                      width: 310,
                      child: Column(
                        children: [
                          Container(
                            height: 100,
                            width: double.maxFinite,
                            child: Row(
                              children: [
                                // Adding a clear button
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, bottom: 8),
                                  child: CircleAvatar(
                                    radius: 50,
                                    backgroundColor: Colors.white70,
                                    child: Center(
                                      child: TextButton(
                                        onPressed: () {
                                          _onClearButtonPressed();
                                        },
                                        child: Text(
                                          'C',
                                          style: TextStyle(
                                              fontSize: 45,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, bottom: 8),
                                  child: CircleAvatar(
                                    radius: 50,
                                    backgroundColor: Colors.white70,
                                    child: Center(
                                      child: Text(
                                        '%',
                                        style: TextStyle(
                                            fontSize: 45, color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 100,
                            width: double.maxFinite,
                            child: Row(
                              children: [
                                for (int i = 7; i <= 9; i++)
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0, bottom: 8),
                                    child: CircleAvatar(
                                      radius: 50,
                                      backgroundColor: Colors.white24,
                                      child: TextButton(
                                        onPressed: () {
                                          _onNumberButtonPressed(i);
                                        },
                                        child: Text(
                                          i.toString(),
                                          style: TextStyle(
                                              fontSize: 45,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Container(
                            height: 100,
                            width: double.maxFinite,
                            child: Row(
                              children: [
                                for (int i = 4; i <= 6; i++)
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0, bottom: 8),
                                    child: CircleAvatar(
                                      radius: 50,
                                      backgroundColor: Colors.white24,
                                      child: TextButton(
                                        onPressed: () {
                                          _onNumberButtonPressed(i);
                                        },
                                        child: Text(
                                          i.toString(),
                                          style: TextStyle(
                                              fontSize: 45,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Container(
                            height: 100,
                            width: double.maxFinite,
                            child: Row(
                              children: [
                                for (int i = 1; i <= 3; i++)
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0, bottom: 8),
                                    child: CircleAvatar(
                                      radius: 50,
                                      backgroundColor: Colors.white24,
                                      child: TextButton(
                                        onPressed: () {
                                          _onNumberButtonPressed(i);
                                        },
                                        child: Text(
                                          i.toString(),
                                          style: TextStyle(
                                              fontSize: 45,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Container(
                            height: 100,
                            width: double.maxFinite,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 90,
                                      width: 185,
                                      decoration: BoxDecoration(
                                          color: Colors.white24,
                                          borderRadius:
                                          BorderRadius.circular(30)),
                                      child: TextButton(
                                        onPressed: () {
                                          _onNumberButtonPressed(0);
                                        },
                                        child: Text(
                                          '0',
                                          style: TextStyle(
                                              fontSize: 45,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: CircleAvatar(
                                      radius: 40,
                                      backgroundColor: Colors.white24,
                                      child: TextButton(
                                        onPressed: () {
                                        },
                                        child: Text(
                                          '.',
                                          style: TextStyle(fontSize: 45, color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          height: 490,
                          width: 120,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 20.0,
                                  top: 13,
                                ),
                                child: CircleAvatar(
                                  radius: 43,
                                  backgroundColor: Colors.orange,
                                  child: Center(
                                    child: TextButton(
                                      onPressed: () {
                                        _onOperationButtonPressed('/');
                                      },
                                      child: Text(
                                        '/',
                                        style: TextStyle(
                                            fontSize: 45, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 20.0,
                                  top: 10,
                                ),
                                child: CircleAvatar(
                                  radius: 43,
                                  backgroundColor: Colors.orange,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 16.0),
                                      child: TextButton(
                                        onPressed: () {
                                          _onOperationButtonPressed('*');
                                        },
                                        child: Text(
                                          '*',
                                          style: TextStyle(
                                              fontSize: 60,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 20.0,
                                  top: 10,
                                ),
                                child: CircleAvatar(
                                  radius: 43,
                                  backgroundColor: Colors.orange,
                                  child: Center(
                                    child: TextButton(
                                      onPressed: () {
                                        _onOperationButtonPressed('-');
                                      },
                                      child: Text(
                                        '-',
                                        style: TextStyle(
                                            fontSize: 70, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 20.0,
                                  top: 10,
                                ),
                                child: CircleAvatar(
                                  radius: 43,
                                  backgroundColor: Colors.orange,
                                  child: Center(
                                    child: TextButton(
                                      onPressed: () {
                                        _onOperationButtonPressed('+');
                                      },
                                      child: Text(
                                        '+',
                                        style: TextStyle(
                                            fontSize: 50, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.only(right: 20.0, top: 10),
                                child: CircleAvatar(
                                  radius: 43,
                                  backgroundColor: Colors.orange,
                                  child: Center(
                                    child: TextButton(
                                      onPressed: () {
                                        _onEqualsButtonPressed();
                                        setState(() {});
                                      },
                                      child: Text(
                                        '=',
                                        style: TextStyle(
                                            fontSize: 50, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
