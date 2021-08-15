import 'package:demo_pro/app/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<bool?> customToast(String? errorMsg,
    {gravity: ToastGravity.BOTTOM,}) async {
  return await Fluttertoast.showToast(
    msg: errorMsg ?? "",
    textColor: Colors.white,
    backgroundColor: AppColor.primaryColor.withOpacity(0.9),
    toastLength: Toast.LENGTH_SHORT,
    timeInSecForIosWeb: 1,
    gravity: gravity,
    fontSize: 20.0,
  );
}