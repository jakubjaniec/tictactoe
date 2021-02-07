import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:TicTacToe/providers/game_provider.dart';

class Button extends StatelessWidget {
  final String text;
  final Color color;

  const Button(this.text, [this.color]);

  @override
  Widget build(BuildContext context) {
    final GameProvider state = context.watch<GameProvider>();
    final Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(top: size.height * 0.04),
      width: size.width * 0.5,
      height: size.height * 0.05,
      child: FlatButton(
        onPressed: () => Navigator.pushNamed(context, '/game'),
        shape: text != 'settings'
            ? RoundedRectangleBorder(
                side: BorderSide(
                  color: color,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(100.0),
              )
            : null,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.grey[400],
            fontFamily: 'Montserrat',
            fontSize: state.getAdaptiveTextSize(context, 16),
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
