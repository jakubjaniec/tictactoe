import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Color color;

  Button(this.text, [this.color]);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.0),
      width: MediaQuery.of(context).size.width / 2,
      child: FlatButton(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        onPressed: () => Navigator.pushNamed(context, '/game'),
        child: Text(
          '$text',
          style: TextStyle(
              color: Colors.grey[500],
              fontFamily: 'Montserrat',
              fontSize: 16.0,
              fontWeight: FontWeight.w400),
        ),
        shape: text != 'settings'
            ? RoundedRectangleBorder(
                side: BorderSide(
                  color: color,
                  width: 2,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(30.0),
              )
            : null,
      ),
    );
  }
}
