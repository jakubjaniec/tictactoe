import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

import 'pages/game.dart';
import 'pages/home.dart';

void main() {
  runApp(
    DevicePreview(enabled: true, builder: (context) => TicTacToe()),
  );
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
