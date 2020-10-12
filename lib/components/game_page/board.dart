import 'package:flutter/material.dart';

import 'package:TicTacToe/components/game_page/field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Board extends StatelessWidget {
  final double size = 310.sp;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50.sp),
      width: size,
      height: size,
      child: Column(
        children: [
          Row(
            children: [
              Field(0, 0, size),
              Field(0, 1, size),
              Field(0, 2, size),
            ],
          ),
          Row(
            children: [
              Field(1, 0, size),
              Field(1, 1, size),
              Field(1, 2, size),
            ],
          ),
          Row(
            children: [
              Field(2, 0, size),
              Field(2, 1, size),
              Field(2, 2, size),
            ],
          ),
        ],
      ),
    );
  }
}
