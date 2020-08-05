import 'package:flutter/material.dart';

import 'pages/game.dart';
import 'pages/home.dart';

void main() {
  runApp(TicTacToe());
}

class TicTacToe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/', routes: {
      '/': (context) => Home(),
      '/game': (context) => Game(),
    });
  }
}
