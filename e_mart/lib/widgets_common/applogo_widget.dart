import 'package:e_mart/consts/consts.dart';
import 'package:flutter/cupertino.dart';

Widget applogowidget(){
  return Image.asset(icAppLogo)
      .box.white.size(77, 77)
      .padding(const EdgeInsets.all(8))
      .rounded.make();
}