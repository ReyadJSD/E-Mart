import 'package:e_mart/consts/consts.dart';
import 'package:flutter/material.dart';
Widget homeButtons(width, height, icon, onPress, String? title){
  return  Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(icon, width: 26,),
      5.heightBox,
      title!.text.fontFamily(semibold).color(darkFontGrey).make()
    ],
  ).box.rounded.white.size(width, height).shadowSm.make();
}