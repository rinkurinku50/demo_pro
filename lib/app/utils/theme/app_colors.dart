import 'package:flutter/material.dart';
 
class AppColor {

  static Map<int, Color> _color = {
    50: Color.fromRGBO(251, 180, 72, .1),
    100: Color.fromRGBO(251, 180, 72, .2),
    200: Color.fromRGBO(251, 180, 72, .3),
    300: Color.fromRGBO(251, 180, 72, .4),
    400: Color.fromRGBO(251, 180, 72, .5),
    500: Color.fromRGBO(251, 180, 72, .6),
    600: Color.fromRGBO(251, 180, 72, .7),
    700: Color.fromRGBO(251, 180, 72, .8),
    800: Color.fromRGBO(251, 180, 72, .9),
    900: Color.fromRGBO(251, 180, 72, 1.0),
  };
  

 static MaterialColor primarySwatch = MaterialColor(0xFFFBB448, _color);

  static final Color primaryColor=Color(0xFFFBB448);
  static final Color accentColor=Color(0xffe46b10);
}