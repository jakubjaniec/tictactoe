import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:device_preview/device_preview.dart';
import 'package:provider/provider.dart';

import 'package:TicTacToe/pages/game.dart';
import 'package:TicTacToe/pages/home.dart';
import 'package:TicTacToe/game_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider.value(
        value: GameModel(),
        child: DevicePreview(
          enabled: !kReleaseMode,
          builder: (context) => TicTacToe(),
        )),
  );
}

class TicTacToe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        locale: DevicePreview.of(context).locale,
        builder: DevicePreview.appBuilder,
        initialRoute: '/',
        routes: {
          '/': (context) => Home(),
          '/game': (context) => Game(),
        });
  }
}
