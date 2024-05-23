import 'package:e_mart/consts/consts.dart';
import 'package:flutter/cupertino.dart';

Widget dedailsCard({width, String? count, String? title}){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      count!.text.fontFamily(bold).color(darkFontGrey).size(16).make(),
      10.heightBox,
      title!.text.color(darkFontGrey).make()
    ],
  ).box.width(width).color(whiteColor).roundedSM.height(60).padding(EdgeInsets.all(4)).make();

}