import 'package:flutter/material.dart';

import 'package:TicTacToe/components/home_page/buttons_wrapper.dart';
import 'package:TicTacToe/components/home_page/button.dart';
import 'package:TicTacToe/components/general/shapes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(411.0, 731.0));
    Orientation orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: SafeArea(
        child: Container(
          padding: orientation == Orientation.portrait
              ? EdgeInsets.only(bottom: 40.sp, top: 50.sp)
              : EdgeInsets.only(bottom: 10.sp, top: 10.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Circle(
                          orientation == Orientation.portrait ? 65.sp : 30.sp),
                      XSign(orientation == Orientation.portrait ? 85.sp : 40.sp)
                    ],
                  ),
                  ButtonsWrapper(),
                  Button('settings'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
