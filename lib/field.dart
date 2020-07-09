import 'package:flutter/material.dart';

class Field extends StatelessWidget {
  final bool disabled = false;

  void handleClick() {
    print('hello world');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400 / 3 - 5,
      height: 400 / 3 - 5,
      color: Colors.grey[300],
      child: Expanded(
        child: FlatButton(
          onPressed: disabled ? null : handleClick,
          child: null,
        ),
      ),
    );
  }
}
