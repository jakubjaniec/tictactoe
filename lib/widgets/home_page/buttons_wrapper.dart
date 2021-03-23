import 'package:flutter/material.dart';
import 'package:tictactoe/widgets/home_page/button.dart';

class ButtonsWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Button('local game', Colors.lightBlue[800]),
        Button('real time game', Colors.yellow[700]),
        Button('invite friends', Colors.green[500]),
      ],
    );
  }
}
