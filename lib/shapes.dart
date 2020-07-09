import 'package:flutter/material.dart';

class XSign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Icon(Icons.close, size: 80),
    );
  }
}

class Circle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Icon(Icons.panorama_fish_eye, size: 80),
    );
  }
}
