
import 'package:demo_pro/app/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleWidget extends StatelessWidget {
  bool isHome;
  TitleWidget({this.isHome:false});
  @override
  Widget build(BuildContext context) {

    return   RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'De',
          style: TextStyle(
            fontSize: 30.sp,
            fontWeight: FontWeight.w700,
            color:isHome ? Colors.white : AppColor.primaryColor,
          ),
          children: [
            TextSpan(
              text: 'mo',
              style: TextStyle(color: Colors.black, fontSize: 30.sp),
            ),
            TextSpan(
              text: 'App',
              style: TextStyle(color: isHome ? Colors.white : AppColor.primaryColor, fontSize: 30.sp),
            ),
          ]),
    );
  }
}
