import 'package:bookly/core/utils/constraint/appStyle.dart';
import 'package:flutter/material.dart';

Widget buildButton(String text, Color bgColor, Color textColor,
    double screenWidth, double screenHeight, void Function()? onTap) {
  return Container(
    alignment: Alignment.center,
    height: screenHeight * 0.06,
    width: screenWidth * 0.4,
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: text == "Free"
          ? BorderRadius.only(
          bottomRight: Radius.circular(20), topLeft: Radius.circular(20))
          : BorderRadius.only(
          bottomLeft: Radius.circular(20), topRight: Radius.circular(20)),
    ),
    child: TextButton(
      onPressed:onTap,
      child: Text(text, style: AppStyle.rgular16.copyWith(color: textColor)),
    ),
  );
}

