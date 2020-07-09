import 'package:flutter/material.dart';

import 'field.dart';

void main() => runApp(MaterialApp(home: TicTacToe()));

class TicTacToe extends StatefulWidget {
  @override
  _TicTacToeState createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  bool xMove = true;

  var movesList = List.generate(3, (i) => List(3), growable: false);

  // saves yours fields' choice into the movesList
  void saveChoice(row, place) {
    if (xMove)
      setState(() {
        movesList[row][place] = 'X';
      });
    else
      setState(() {
        movesList[row][place] = 'O';
      });

    setState(() {
      xMove = !xMove;
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(movesList);
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Field(saveChoice, movesList, 0, 0),
                          Field(saveChoice, movesList, 0, 1),
                          Field(saveChoice, movesList, 0, 2),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Field(saveChoice, movesList, 1, 0),
                          Field(saveChoice, movesList, 1, 1),
                          Field(saveChoice, movesList, 1, 2),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Field(saveChoice, movesList, 2, 0),
                          Field(saveChoice, movesList, 2, 1),
                          Field(saveChoice, movesList, 2, 2),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
