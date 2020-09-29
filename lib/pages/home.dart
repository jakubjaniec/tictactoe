import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: Center(
        child: IconButton(
          onPressed: () => Navigator.pushNamed(context, '/game'),
          icon: Icon(Icons.play_arrow),
          color: Colors.white,
          iconSize: 100,
        ),
      ),
    );
  }
}
