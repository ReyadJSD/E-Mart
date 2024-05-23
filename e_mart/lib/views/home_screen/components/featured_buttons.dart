import 'package:e_mart/consts/consts.dart';
import 'package:flutter/material.dart';

Widget featuredButtons({icon, String? title}){
  return Row(
    children: [
      Image.asset(icon, width: 60, fit: BoxFit.fill,),
      10.widthBox,
      title!.text.fontFamily(semibold).color(darkFontGrey).make()
    ],
  ).box.width(200).padding(const EdgeInsets.all(4)).margin(const EdgeInsets.symmetric(horizontal: 4)).white.roundedSM.outerShadowSm.make();
}