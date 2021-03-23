import 'package:flutter/material.dart';
import 'package:tictactoe/widgets/game_page/field.dart';

class Board extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final double boardSize = size.width * 0.75;

    return Container(
      margin: EdgeInsets.only(top: size.height * 0.1),
      width: boardSize,
      height: boardSize,
      child: Column(
        children: [
          Row(
            children: [
              Field(0, 0, boardSize),
              Field(0, 1, boardSize),
              Field(0, 2, boardSize),
            ],
          ),
          Row(
            children: [
              Field(1, 0, boardSize),
              Field(1, 1, boardSize),
              Field(1, 2, boardSize),
            ],
          ),
          Row(
            children: [
              Field(2, 0, boardSize),
              Field(2, 1, boardSize),
              Field(2, 2, boardSize),
            ],
          ),
        ],
      ),
    );
  }
}
