import 'package:flutter/material.dart';

import 'components/modals.dart';
// import 'components/shapes.dart';
import 'components/board.dart';
import 'components/results.dart';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  bool xMove = true;
  String winner = '';
  bool draw = false;
  int movesCounter = 0;

  int xWins = 0;
  int oWins = 0;
  int draws = 0;
  bool restart = false;

  List movesList = List.generate(3, (i) => List(3), growable: false);

  // saves yours field choice into the movesList
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
    if (winner == 'X') {
      setState(() {
        xWins++;
      });
    } else if (winner == 'O')
      setState(() {
        oWins++;
      });
    if (draw)
      setState(() {
        draws++;
      });

    setState(() {
      restart = true;
      xMove = !xMove;
      winner = '';
      draw = false;
      movesCounter = 0;
      movesList = List.generate(3, (i) => List(3), growable: false);
    });
  }

  void changeRestart() async {
    setState(() {
      restart = false;
    });
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
      backgroundColor: Colors.grey[850],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                child: Text(
              'It\'s X move',
              style: TextStyle(color: Colors.grey[500], fontSize: 22),
            )),
            Board(saveChoice, movesList, restart, changeRestart),
            Results(xWins, oWins, draws),
          ],
        ),
      ),
    );
  }
}
