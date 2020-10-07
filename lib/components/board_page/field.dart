import 'dart:async';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:TicTacToe/game_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:TicTacToe/components/general/shapes.dart';

class Field extends StatefulWidget {
  final int row;
  final int place;
  final double size;

  Field(this.row, this.place, this.size);

  @override
  _FieldState createState() => _FieldState();
}

class _FieldState extends State<Field> {
  bool disabled = false;

  void handleClick(saveChoice, context) {
    saveChoice(widget.row, widget.place, context);

    setState(() {
      disabled = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<GameModel>(context, listen: true);
    if (state.restart) {
      Timer(Duration(milliseconds: 1), () {
        setState(() {
          disabled = false;
        });
        state.handleRestart();
      });
    }

    return Container(
      width: widget.size / 3,
      height: widget.size / 3,
      decoration: BoxDecoration(
          border: state.determineBorder(widget.row, widget.place)),
      child: FlatButton(
        onPressed:
            disabled ? null : () => handleClick(state.saveChoice, context),
        child: disabled
            ? (state.movesList[widget.row][widget.place] == 'X'
                ? XSign(65.sp)
                : state.movesList[widget.row][widget.place] == 'O'
                    ? Circle(60.sp)
                    : null)
            : null,
      ),
    );
  }
}
