import 'package:flutter/material.dart';

import 'package:TicTacToe/components/home_page/shapesLogo.dart';
import 'package:TicTacToe/components/home_page/buttonsWrapper.dart';
import 'package:TicTacToe/components/home_page/button.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ShapesLogo(),
              ButtonsWrapper(),
              Button('settings'),
            ],
          ),
        ],
      ),
    );
  }
}

// child: IconButton(
//   onPressed: () => Navigator.pushNamed(context, '/game'),
//   icon: Icon(Icons.play_arrow),
//   color: Colors.white,
//   iconSize: 100,
// ),
