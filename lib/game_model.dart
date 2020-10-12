import 'package:flutter/material.dart';

import 'package:TicTacToe/components/game_page/result_modals.dart';

class GameModel extends ChangeNotifier {
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
    String x = 'X';
    String o = 'O';

    for (int i = 0; i < 3; i++) {
      // horizontal check
      if (movesList[i][0] == x && movesList[i][1] == x && movesList[i][2] == x)
        winner = x;
      else if (movesList[i][0] == o &&
          movesList[i][1] == o &&
          movesList[i][2] == o) winner = o;

      // vertical check
      if (movesList[0][i] == x && movesList[1][i] == x && movesList[2][i] == x)
        winner = x;
      else if (movesList[0][i] == o &&
          movesList[1][i] == o &&
          movesList[2][i] == o) winner = o;

      // cross check
      if ((movesList[0][0] == x &&
              movesList[1][1] == x &&
              movesList[2][2] == x) ||
          (movesList[0][2] == x &&
              movesList[1][1] == x &&
              movesList[2][0] == x))
        winner = x;
      else if ((movesList[0][0] == o &&
              movesList[1][1] == o &&
              movesList[2][2] == o) ||
          (movesList[0][2] == o &&
              movesList[1][1] == o &&
              movesList[2][0] == o)) winner = o;
    }
    if (winner == '' && movesCounter == 9) draw = true;

    if (winner != '' || draw == true) showModal(context);

    notifyListeners();
  }

  void showModal(context) async {
    if (winner != '' || draw)
      await ResultModal.modal(context, winner, draw, restartGame);

    notifyListeners();
  }

  void restartGame() {
    if (winner == 'X') {
      xWins++;
    } else if (winner == 'O') oWins++;

    if (draw) draws++;

    restart = true;
    winner = '';
    draw = false;
    movesCounter = 0;
    movesList = List.generate(3, (i) => List(3), growable: false);
    notifyListeners();
  }

  void handleRestart() {
    restart = false;
    notifyListeners();
  }

  Border determineBorder(row, place) {
    Border border = Border.all(width: 1, color: Colors.grey[700]);
    BorderSide borderSide = BorderSide(width: 1, color: Colors.grey[700]);

    if (row == 0 && place == 0)
      border = Border(bottom: borderSide, right: borderSide);
    if (row == 0 && place == 1)
      border = Border(bottom: borderSide, right: borderSide, left: borderSide);
    if (row == 0 && place == 2)
      border = Border(bottom: borderSide, left: borderSide);
    if (row == 1 && place == 0)
      border = Border(bottom: borderSide, right: borderSide, top: borderSide);
    if (row == 1 && place == 2)
      border = Border(bottom: borderSide, left: borderSide, top: borderSide);
    if (row == 2 && place == 0)
      border = Border(top: borderSide, right: borderSide);
    if (row == 2 && place == 1)
      border = Border(right: borderSide, left: borderSide, top: borderSide);
    if (row == 2 && place == 2)
      border = Border(left: borderSide, top: borderSide);

    return border;
  }
}
