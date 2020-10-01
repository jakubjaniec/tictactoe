import 'package:flutter/material.dart';

import 'package:TicTacToe/components/general/shapes.dart';

class ShapesLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Circle(50), XSign(60)],
    );
  }
}
