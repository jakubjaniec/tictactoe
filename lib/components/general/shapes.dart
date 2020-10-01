import 'package:flutter/material.dart';

class XSign extends StatelessWidget {
  final double shapeSize;

  XSign(this.shapeSize);

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.close, size: shapeSize, color: Colors.lightBlue[800]);
  }
}

class Circle extends StatelessWidget {
  final double shapeSize;

  Circle(this.shapeSize);

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.panorama_fish_eye,
        size: shapeSize, color: Colors.yellow[700]);
  }
}
