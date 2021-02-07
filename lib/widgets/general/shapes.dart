import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class XSign extends StatelessWidget {
  final double shapeSize;

  const XSign(this.shapeSize);

  @override
  Widget build(BuildContext context) {
    return Icon(
      LineAwesomeIcons.times,
      size: shapeSize,
      color: Colors.lightBlue[800],
    );
  }
}

class Circle extends StatelessWidget {
  final double shapeSize;

  const Circle(this.shapeSize);

  @override
  Widget build(BuildContext context) {
    return Icon(
      LineAwesomeIcons.circle,
      size: shapeSize,
      color: Colors.yellow[700],
    );
  }
}
