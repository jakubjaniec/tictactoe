import 'package:flutter/material.dart';
import 'shapes.dart';

class Field extends StatefulWidget {
  final Function saveChoice;
  final List movesList;
  final int row;
  final int place;

  Field(this.saveChoice, this.movesList, this.row, this.place);
  @override
  _FieldState createState() =>
      _FieldState(this.saveChoice, this.movesList, this.row, this.place);
}

class _FieldState extends State<Field> {
  bool disabled = false;

  final Function saveChoice;
  final List movesList;
  final int row;
  final int place;

  _FieldState(this.saveChoice, this.movesList, this.row, this.place);

  void handleClick() {
    saveChoice(row, place);

    setState(() {
      disabled = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400 / 3 - 5,
      height: 400 / 3 - 5,
      color: Colors.grey[300],
      child: FlatButton(
        onPressed: disabled ? null : handleClick,
        child: disabled
            ? (movesList[row][place] == 'X' ? XSign() : Circle())
            : null,
      ),
    );
  }
}
