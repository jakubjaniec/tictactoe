import 'package:flutter/material.dart';
import 'package:TicTacToe/model.dart';
import 'package:provider/provider.dart';

import 'package:TicTacToe/components/board_page/shapes.dart';

class WhoseMove extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var state = Provider.of<Model>(context, listen: true);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'It\'s',
          style: TextStyle(color: Colors.grey[500], fontSize: 20),
        ),
        state.xMove
            ? XSign(30)
            : Container(
                margin: EdgeInsets.symmetric(horizontal: 5), child: Circle(30)),
        Text(
          'move',
          style: TextStyle(color: Colors.grey[500], fontSize: 20),
        )
      ],
    );
  }
}
