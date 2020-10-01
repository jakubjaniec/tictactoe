import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:provider/provider.dart';

import 'pages/game.dart';
import 'pages/home.dart';
import './model.dart';

void main() {
  runApp(
    ChangeNotifierProvider.value(
        value: Model(),
        child: DevicePreview(enabled: true, builder: (context) => TicTacToe())),
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
