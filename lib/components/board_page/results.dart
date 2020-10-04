import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:TicTacToe/model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Results extends StatelessWidget {
  TextStyle playerName() {
    return TextStyle(fontSize: 18.sp, color: Colors.grey[500]);
  }

  TextStyle score() {
    return TextStyle(
      fontSize: 48.sp,
      color: Colors.white,
      fontWeight: FontWeight.w200,
    );
  }

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<Model>(context, listen: true);

    return Container(
      margin: EdgeInsets.only(bottom: 30, top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text('Player 1', style: playerName()),
              SizedBox(height: 8),
              Text('${state.xWins}', style: score())
            ],
          ),
          Column(
            children: [
              Text('Draws', style: playerName()),
              SizedBox(height: 8),
              Text('${state.draws}', style: score())
            ],
          ),
          Column(
            children: [
              Text('Player 2', style: playerName()),
              SizedBox(height: 8),
              Text('${state.oWins}', style: score())
            ],
          ),
        ],
      ),
    );
  }
}
