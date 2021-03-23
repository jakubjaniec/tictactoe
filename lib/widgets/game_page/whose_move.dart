import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:tictactoe/providers/game_provider.dart';
import 'package:tictactoe/widgets/general/shapes.dart';

class WhoseMove extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GameProvider state = context.watch<GameProvider>();
    final Size size = MediaQuery.of(context).size;

    final style = TextStyle(
        color: Colors.grey[500],
        fontSize: state.getAdaptiveTextSize(context, 20));

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "It's",
          style: style,
        ),
        if (state.xMove)
          Container(
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.0125),
              child: XSign(
                size.height * 0.035,
                // state.getAdaptiveTextSize(
                //   context,
                //   size.width * 0.06,
                // ),
              ))
        else
          Container(
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.0125),
              child: Circle(
                size.height * 0.035,
                // state.getAdaptiveTextSize(
                //   context,
                //   size.width * 0.06,
                // ),
              )),
        Text(
          'move',
          style: style,
        )
      ],
    );
  }
}
