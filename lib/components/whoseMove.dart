import 'package:flutter/material.dart';

import 'shapes.dart';

class WhoseMove extends StatelessWidget {
  final bool xMove;

  WhoseMove(this.xMove);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'It\'s',
          style: TextStyle(color: Colors.grey[500], fontSize: 22),
        ),
        xMove
            ? XSign(35)
            : Container(
                margin: EdgeInsets.symmetric(horizontal: 5), child: Circle(35)),
        Text(
          'move',
          style: TextStyle(color: Colors.grey[500], fontSize: 22),
        )
      ],
    );
  }
}
