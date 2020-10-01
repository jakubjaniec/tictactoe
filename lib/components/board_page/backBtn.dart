import 'package:flutter/material.dart';

class BackBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
      onPressed: () {
        Navigator.pop(context);
      },
      textColor: Colors.white,
      icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
      label: Text('Back', style: TextStyle(fontSize: 16)),
      color: Colors.transparent,
    );
  }
}
