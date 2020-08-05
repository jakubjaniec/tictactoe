import 'package:flutter/material.dart';

import 'shapes.dart';

class Field extends StatefulWidget {
  final Function saveChoice;
  final List movesList;
  final int row;
  final int place;
  final bool restart;
  final Function changeRestart;

  Field(this.saveChoice, this.movesList, this.row, this.place, this.restart,
      this.changeRestart);

  @override
  _FieldState createState() => _FieldState();
}

class _FieldState extends State<Field> {
  bool disabled = false;

  void handleClick() {
    widget.saveChoice(widget.row, widget.place);

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
    if (widget.restart) {
      widget.changeRestart();
      setState(() {
        disabled = false;
      });
    }

    return Container(
      width: 350 / 3,
      height: 350 / 3,
      decoration: BoxDecoration(border: determineBorder()),
      child: FlatButton(
        onPressed: disabled ? null : handleClick,
        child: disabled
            ? (widget.movesList[widget.row][widget.place] == 'X'
                ? XSign(80)
                : widget.movesList[widget.row][widget.place] == 'O'
                    ? Circle(80)
                    : null)
            : null,
      ),
    );
  }
}
