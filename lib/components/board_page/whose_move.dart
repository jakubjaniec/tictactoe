import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:TicTacToe/game_model.dart';
import 'package:TicTacToe/components/general/shapes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WhoseMove extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var state = Provider.of<GameModel>(context, listen: true);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'It\'s',
          style: TextStyle(color: Colors.grey[500], fontSize: 23.sp),
        ),
        state.xMove
            ? XSign(30.sp)
            : Container(
                margin: EdgeInsets.symmetric(horizontal: 5.sp),
                child: Circle(30.sp)),
        Text(
          'move',
          style: TextStyle(color: Colors.grey[500], fontSize: 23.sp),
        )
      ],
    );
  }
}
