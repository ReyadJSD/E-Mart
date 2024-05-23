import 'package:e_mart/consts/consts.dart';
import 'package:flutter/material.dart';

Widget customTextField(String? title, String? hint,controller,isPass){
  return Column(
    children: [
      Align(
        alignment: Alignment.centerLeft,
          child: title!.text.fontFamily(semibold).size(16).make()
      ),
      5.heightBox,
      TextField(
        controller: controller,
        obscureText: isPass,
        decoration: InputDecoration(
          hintStyle: const TextStyle(
            fontFamily: semibold,
            color: textfieldGrey,
          ),
          hintText: hint,
          isDense: true,
          fillColor: lightGrey,
          filled:true,
          border: InputBorder.none,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: redColor
            )
          )
        ),
      )
    ],
  );
}