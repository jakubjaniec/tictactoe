import 'package:flutter/material.dart';

import 'package:TicTacToe/components/board_page/whoseMove.dart';
import 'package:TicTacToe/components/board_page/board.dart';
import 'package:TicTacToe/components/board_page/results.dart';
import 'package:TicTacToe/components/board_page/backBtn.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class Game extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(411.0, 731.0));
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BackBtn(),
              ],
            ),
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
