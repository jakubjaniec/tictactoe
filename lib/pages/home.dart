import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
                textColor: Colors.white,
                color: Colors.transparent,
                onPressed: () {
                  Navigator.pushNamed(context, '/game');
                },
                child: Text('play',
                    style: TextStyle(fontSize: 26, letterSpacing: 1.5))),
            FlatButton(
                textColor: Colors.grey[400],
                color: Colors.transparent,
                onPressed: () {
                  // Navigator.pushNamed(context, '/game');
                },
                child: Text('settings',
                    style: TextStyle(fontSize: 26, letterSpacing: 1.5))),
          ],
        ),
      ),
    );
  }
}
