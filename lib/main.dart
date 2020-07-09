import 'package:flutter/material.dart';

import 'field.dart';

void main() => runApp(MaterialApp(home: TicTacToe()));

class TicTacToe extends StatefulWidget {
  @override
  _TicTacToeState createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Flex(
      direction: Axis.vertical,
      children: [
        Expanded(
          child: Container(
            color: Colors.grey[600],
            child: Center(
              child: Container(
                width: 400,
                height: 400,
                color: Colors.grey[500],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Field(),
                        Field(),
                        Field(),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Field(),
                        Field(),
                        Field(),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Field(),
                        Field(),
                        Field(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}

// Container(width: 50, height: 50, color: Colors.black)
