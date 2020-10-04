import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Button extends StatelessWidget {
  final String text;
  final Color color;

  Button(this.text, [this.color]);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(411.0, 731.0));

    var width = MediaQuery.of(context).size.width;
    var orientation = MediaQuery.of(context).orientation;

    var deviceType = width >= 600 ? 'tablet' : 'mobile';

    return Container(
      margin: orientation == Orientation.portrait
          ? EdgeInsets.only(top: 25.0.sp)
          : EdgeInsets.only(top: 10.0.sp),
      width: orientation == Orientation.portrait
          ? deviceType == 'mobile' ? width / 1.744 : width / 1.844
          : deviceType == 'mobile' ? width / 2.4 : width / 2.5,
      child: AspectRatio(
        aspectRatio: orientation == Orientation.portrait ? 5 : 6,
        child: FlatButton(
          onPressed: () => Navigator.pushNamed(context, '/game'),
          child: Text(
            '$text',
            style: TextStyle(
                color: Colors.grey[400],
                fontFamily: 'Montserrat',
                fontSize: orientation == Orientation.portrait
                    ? deviceType == 'mobile' ? 21.sp : 19.sp
                    : deviceType == 'mobile' ? 15.sp : 14.sp,
                fontWeight: FontWeight.w400),
          ),
          shape: text != 'settings'
              ? RoundedRectangleBorder(
                  side: BorderSide(
                    color: color,
                    width: 2,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(100.0),
                )
              : null,
        ),
      ),
    );
  }
}
