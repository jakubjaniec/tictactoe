import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/providers/game_provider.dart';

class Results extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GameProvider state = context.watch<GameProvider>();
    final Size size = MediaQuery.of(context).size;

    final TextStyle playerName = TextStyle(
      fontSize: state.getAdaptiveTextSize(context, 16),
      color: Colors.grey[500],
    );

    final TextStyle score = TextStyle(
      fontSize: state.getAdaptiveTextSize(context, 40),
      color: Colors.white,
      fontWeight: FontWeight.w200,
    );

    return Container(
      margin:
          EdgeInsets.only(bottom: size.height * 0.04, top: size.height * 0.04),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text('Player 1', style: playerName),
              SizedBox(height: size.height * 0.012),
              Text('${state.xWins}', style: score)
            ],
          ),
          Column(
            children: [
              Text('Draws', style: playerName),
              SizedBox(height: size.height * 0.012),
              Text('${state.draws}', style: score)
            ],
          ),
          Column(
            children: [
              Text('Player 2', style: playerName),
              SizedBox(height: size.height * 0.012),
              Text('${state.oWins}', style: score)
            ],
          ),
        ],
      ),
    );
  }
}
