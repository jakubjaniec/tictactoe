import 'package:flutter/material.dart';
import 'package:TicTacToe/widgets/game_page/game_page_widgets.dart';

class Game extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BackBtn(),
            Column(
              children: [
                WhoseMove(),
                Board(),
              ],
            ),
            Results(),
          ],
        ),
      ),
    );
  }
}
