import 'package:flutter/material.dart';

import 'package:TicTacToe/components/board_page/modals.dart';

class Model extends ChangeNotifier {
  bool xMove = true;
  String winner = '';
  bool draw = false;
  int movesCounter = 0;

  int xWins = 0;
  int oWins = 0;
  int draws = 0;
  bool restart = false;

  List movesList = List.generate(3, (i) => List(3), growable: false);

  void saveChoice(row, place, context) {
    if (xMove)
      movesList[row][place] = 'X';
    else
      movesList[row][place] = 'O';

    xMove = !xMove;
    movesCounter++;

    checkWinner(context);
    notifyListeners();
  }

  void checkWinner(context) {
    for (int i = 0; i < 3; i++) {
      // horizontal check
      if (movesList[i][0] == 'X' &&
          movesList[i][1] == 'X' &&
          movesList[i][2] == 'X')
        winner = 'X';
      else if (movesList[i][0] == 'O' &&
          movesList[i][1] == 'O' &&
          movesList[i][2] == 'O') winner = 'O';

      // vertical check
      if (movesList[0][i] == 'X' &&
          movesList[1][i] == 'X' &&
          movesList[2][i] == 'X')
        winner = 'X';
      else if (movesList[0][i] == 'O' &&
          movesList[1][i] == 'O' &&
          movesList[2][i] == 'O') winner = 'O';

      // cross check
      if ((movesList[0][0] == 'X' &&
              movesList[1][1] == 'X' &&
              movesList[2][2] == 'X') ||
          (movesList[0][2] == 'X' &&
              movesList[1][1] == 'X' &&
              movesList[2][0] == 'X'))
        winner = 'X';
      else if ((movesList[0][0] == 'O' &&
              movesList[1][1] == 'O' &&
              movesList[2][2] == 'O') ||
          (movesList[0][2] == 'O' &&
              movesList[1][1] == 'O' &&
              movesList[2][0] == 'O')) winner = 'O';
    }
    if (winner == '' && movesCounter == 9) draw = true;

    if (winner != '' || draw == true) showModal(context);

    notifyListeners();
  }

  void showModal(context) async {
    draw
        ? await Modal.drawModal(context, restartGame)
        : await Modal.winnerModal(context, winner, restartGame);
    notifyListeners();
  }

  void restartGame() {
    if (winner == 'X') {
      xWins++;
    } else if (winner == 'O') oWins++;

    if (draw) draws++;

    restart = true;
    xMove = !xMove;
    winner = '';
    draw = false;
    movesCounter = 0;
    movesList = List.generate(3, (i) => List(3), growable: false);
    notifyListeners();
  }

  void changeRestart() {
    restart = false;
    notifyListeners();
  }
}
