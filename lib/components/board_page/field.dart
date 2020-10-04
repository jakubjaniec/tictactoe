import 'dart:async';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:TicTacToe/model.dart';
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

  Border determineBorder() {
    Border determinedBorder = Border.all(width: 1, color: Colors.grey[700]);
    var borderSide = BorderSide(width: 1, color: Colors.grey[700]);

    if (widget.row == 0 && widget.place == 0)
      determinedBorder = Border(bottom: borderSide, right: borderSide);
    if (widget.row == 0 && widget.place == 1)
      determinedBorder =
          Border(bottom: borderSide, right: borderSide, left: borderSide);
    if (widget.row == 0 && widget.place == 2)
      determinedBorder = Border(bottom: borderSide, left: borderSide);
    if (widget.row == 1 && widget.place == 0)
      determinedBorder =
          Border(bottom: borderSide, right: borderSide, top: borderSide);
    if (widget.row == 1 && widget.place == 2)
      determinedBorder =
          Border(bottom: borderSide, left: borderSide, top: borderSide);
    if (widget.row == 2 && widget.place == 0)
      determinedBorder = Border(top: borderSide, right: borderSide);
    if (widget.row == 2 && widget.place == 1)
      determinedBorder =
          Border(right: borderSide, left: borderSide, top: borderSide);
    if (widget.row == 2 && widget.place == 2)
      determinedBorder = Border(left: borderSide, top: borderSide);

    return determinedBorder;
  }

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<Model>(context, listen: true);
    if (state.restart) {
      Timer(Duration(milliseconds: 1), () {
        setState(() {
          disabled = false;
        });
        state.changeRestart();
      });
    }

    return Container(
      width: widget.size / 3,
      height: widget.size / 3,
      decoration: BoxDecoration(border: determineBorder()),
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
