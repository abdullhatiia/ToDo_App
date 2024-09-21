import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

configration(){
  EasyLoading.instance
    // ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..maskType=EasyLoadingMaskType.black
    // ..progressColor =const Color(0xff5D9CEC)
    ..backgroundColor = Colors.white
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.white
    ..indicatorColor=Color(0xff5D9CEC)
    // ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = false
    ..dismissOnTap = false;
    // ..customAnimation = CustomAnimation();
}