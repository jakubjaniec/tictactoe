import 'package:flutter/material.dart';

import 'package:TicTacToe/components/board_page/field.dart';

class Board extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      width: 250,
      height: 250,
      child: Column(
        children: [
          Row(
            children: [
              Field(0, 0),
              Field(0, 1),
              Field(0, 2),
            ],
          ),
          Row(
            children: [
              Field(1, 0),
              Field(1, 1),
              Field(1, 2),
            ],
          ),
          Row(
            children: [
              Field(2, 0),
              Field(2, 1),
              Field(2, 2),
            ],
          ),
        ],
      ),
    );
  }
}
