import 'package:flutter/material.dart';

import 'pages/game.dart';

void main() => runApp(MaterialApp(home: TicTacToe()));

class TicTacToe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Game();
  }
}
