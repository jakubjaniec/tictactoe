import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'field.dart';
import 'modals.dart';

void main() => runApp(MaterialApp(home: Phoenix(child: TicTacToe())));

class TicTacToe extends StatefulWidget {
  @override
  _TicTacToeState createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  bool xMove = true;
  String winner = '';
  bool draw = false;
  int movesCounter = 0;

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
      movesCounter++;
    });
    checkWinner();
  }

  void showModal() async {
    draw
        ? await Modal.drawModal(context, restartGame)
        : await Modal.winnerModal(context, winner, restartGame);
  }

  void restartGame() {
    Phoenix.rebirth(context);
  }

  void checkWinner() {
    for (int i = 0; i < 3; i++) {
      // horizontal check
      if (movesList[i][0] == 'X' &&
          movesList[i][1] == 'X' &&
          movesList[i][2] == 'X')
        setState(() {
          winner = 'X';
        });
      else if (movesList[i][0] == 'O' &&
          movesList[i][1] == 'O' &&
          movesList[i][2] == 'O')
        setState(() {
          winner = 'O';
        });

      // vertical check
      if (movesList[0][i] == 'X' &&
          movesList[1][i] == 'X' &&
          movesList[2][i] == 'X')
        setState(() {
          winner = 'X';
        });
      else if (movesList[0][i] == 'O' &&
          movesList[1][i] == 'O' &&
          movesList[2][i] == 'O')
        setState(() {
          winner = 'O';
        });

      // cross check
      if ((movesList[0][0] == 'X' &&
              movesList[1][1] == 'X' &&
              movesList[2][2] == 'X') ||
          (movesList[0][2] == 'X' &&
              movesList[1][1] == 'X' &&
              movesList[2][0] == 'X'))
        setState(() {
          winner = 'X';
        });
      else if ((movesList[0][0] == 'O' &&
              movesList[1][1] == 'O' &&
              movesList[2][2] == 'O') ||
          (movesList[0][2] == 'O' &&
              movesList[1][1] == 'O' &&
              movesList[2][0] == 'O'))
        setState(() {
          winner = 'O';
        });
    }
    if (winner == '' && movesCounter == 9)
      setState(() {
        draw = true;
      });

    if (winner != '' || draw == true) showModal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Flex(
        direction: Axis.vertical,
        children: [
          Expanded(
            child: Container(
              color: Colors.grey[600],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 60),
                    child: Text(
                      xMove ? 'X MOVE' : 'O MOVE',
                      style: TextStyle(fontSize: 32.0, color: Colors.grey[300]),
                    ),
                  ),
                  Center(
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
