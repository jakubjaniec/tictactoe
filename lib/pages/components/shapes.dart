import 'package:flutter/material.dart';

class XSign extends StatelessWidget {
  final double shapeSize;
  final bool active;

  XSign(this.shapeSize, this.active);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Icon(Icons.close,
          size: shapeSize, color: active ? Colors.teal[400] : Colors.grey[600]),
    );
  }
}

class Circle extends StatelessWidget {
  final double shapeSize;
  final bool active;

  Circle(this.shapeSize, this.active);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Icon(Icons.panorama_fish_eye,
          size: shapeSize, color: active ? Colors.red[300] : Colors.grey[600]),
    );
  }
}
