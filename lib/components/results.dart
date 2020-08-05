import 'package:flutter/material.dart';

class Results extends StatelessWidget {
  final int xWins;
  final int oWins;
  final int draws;

  Results(this.xWins, this.oWins, this.draws);

  TextStyle playerName() {
    return TextStyle(fontSize: 18, color: Colors.grey[500]);
  }

  TextStyle score() {
    return TextStyle(
      fontSize: 36,
      color: Colors.white,
      fontWeight: FontWeight.w200,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30, top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text('Player 1', style: playerName()),
              SizedBox(height: 8),
              Text('$xWins', style: score())
            ],
          ),
          Column(
            children: [
              Text('Draws', style: playerName()),
              SizedBox(height: 8),
              Text('$draws', style: score())
            ],
          ),
          Column(
            children: [
              Text('Player 2', style: playerName()),
              SizedBox(height: 8),
              Text('$oWins', style: score())
            ],
          ),
        ],
      ),
    );
  }
}
