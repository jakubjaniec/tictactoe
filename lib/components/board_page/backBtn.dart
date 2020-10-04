import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
      onPressed: () {
        Navigator.pop(context);
      },
      textColor: Colors.white,
      icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 22.sp),
      label: Text('Back', style: TextStyle(fontSize: 18.sp)),
      color: Colors.transparent,
    );
  }
}
