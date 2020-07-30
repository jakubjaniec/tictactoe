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

  Border determineBorder(row, place) {
    Border determinedBorder = Border.all(width: 2, color: Colors.grey[700]);
    var borderSide = BorderSide(width: 2, color: Colors.grey[700]);

    switch ([row, place]) {
      case [0, 0]:
        determinedBorder = Border(bottom: borderSide, right: borderSide);
        break;
      case [0, 1]:
        determinedBorder =
            Border(bottom: borderSide, right: borderSide, left: borderSide);
        break;
      // default:
      //   determinedBorder = Border(bottom: borderSide);
      //   break;
    }

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
      width: 350 / 3 - 3,
      height: 350 / 3 - 3,
      // color: Colors.grey[850],
      decoration:
          BoxDecoration(border: determineBorder(widget.row, widget.place)),
      child: FlatButton(
        onPressed: disabled ? null : handleClick,
        child: disabled
            ? (widget.movesList[widget.row][widget.place] == 'X'
                ? XSign(80, true)
                : widget.movesList[widget.row][widget.place] == 'O'
                    ? Circle(80, true)
                    : null)
            : null,
      ),
    );
  }
}
