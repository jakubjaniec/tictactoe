import 'package:flutter/material.dart';

import 'field.dart';

class Board extends StatefulWidget {
  final Function saveChoice;
  final List movesList;
  final bool restart;
  final Function changeRestart;

  Board(this.saveChoice, this.movesList, this.restart, this.changeRestart);

  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      width: 350,
      height: 350,
      child: Column(
        children: [
          Row(
            children: [
              Field(widget.saveChoice, widget.movesList, 0, 0, widget.restart,
                  widget.changeRestart),
              Field(widget.saveChoice, widget.movesList, 0, 1, widget.restart,
                  widget.changeRestart),
              Field(widget.saveChoice, widget.movesList, 0, 2, widget.restart,
                  widget.changeRestart),
            ],
          ),
          Row(
            children: [
              Field(widget.saveChoice, widget.movesList, 1, 0, widget.restart,
                  widget.changeRestart),
              Field(widget.saveChoice, widget.movesList, 1, 1, widget.restart,
                  widget.changeRestart),
              Field(widget.saveChoice, widget.movesList, 1, 2, widget.restart,
                  widget.changeRestart),
            ],
          ),
          Row(
            children: [
              Field(widget.saveChoice, widget.movesList, 2, 0, widget.restart,
                  widget.changeRestart),
              Field(widget.saveChoice, widget.movesList, 2, 1, widget.restart,
                  widget.changeRestart),
              Field(widget.saveChoice, widget.movesList, 2, 2, widget.restart,
                  widget.changeRestart),
            ],
          ),
        ],
      ),
    );
  }
}
