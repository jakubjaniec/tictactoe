import 'package:flutter/material.dart';

class Modal {
  static Future winnerModal(
    BuildContext context,
    String winner,
    Function playAgain,
  ) async {
    final action = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: EdgeInsets.all(20.0),
          title: Text('$winner is the winner!'),
          actions: [
            FlatButton(
              onPressed: () {
                playAgain();
                Navigator.of(context).pop();
              },
              child: Text('Play again'),
            ),
          ],
        );
      },
    );
    return (action != null) ? action : null;
  }
}
