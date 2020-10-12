import 'package:flutter/material.dart';

class ResultModal {
  static Future modal(
    BuildContext context,
    String winner,
    bool draw,
    Function playAgain,
  ) async {
    final action = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.blueGrey[800],
          titlePadding: EdgeInsets.all(20.0),
          title: Text(
            !draw ? "$winner is the winner" : 'Draw!',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            FlatButton(
              onPressed: () {
                playAgain();
                Navigator.of(context).pop();
              },
              child: Text(
                'Play again',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
    return (action != null) ? action : null;
  }
}
