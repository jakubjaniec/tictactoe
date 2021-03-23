import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' as service;

import 'package:device_preview/device_preview.dart';
import 'package:provider/provider.dart';

import 'package:tictactoe/views/game.dart';
import 'package:tictactoe/views/home.dart';
import 'package:tictactoe/providers/game_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
        create: (context) => GameProvider(),
        child: DevicePreview(
          enabled: !kReleaseMode,
          builder: (context) => TicTacToe(),
        )),
  );
}

class TicTacToe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    service.SystemChrome.setPreferredOrientations([
      service.DeviceOrientation.portraitUp,
      service.DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        initialRoute: '/',
        routes: {
          '/': (context) => Home(),
          '/game': (context) => Game(),
        });
  }
}
