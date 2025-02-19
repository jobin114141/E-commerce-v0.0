import 'package:flutter/material.dart';
import 'package:tanzero/views/colors_const.dart';

Widget BackButtton(context) {
  return InkWell(
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
    onTap: () {
      Navigator.pop(context);
    },
    child: Icon(
      Icons.arrow_back_ios,
      color: buttonClr,
    ),
  );
}

Widget MainButton1(screenWidth, screenHeight, mainText) {
  return Container(
    width: screenWidth,
    height: screenHeight * 0.053,
    decoration: BoxDecoration(
        color: primaryColor, borderRadius: BorderRadius.circular(12)),
    child: Center(
        child: Text(
      mainText,
      style: TextStyle(
          color: Colors.white,
          fontSize: screenWidth * 0.04,
          fontWeight: FontWeight.w800),
    )),
  );
}

Widget MainButton2(screenWidth, screenHeight, mainText) {
  return Padding(
    padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
    child: Container(
      width: screenWidth,
      height: screenHeight * 0.053,
      decoration: BoxDecoration(
          border: Border.all(color: primaryColor),
          borderRadius: BorderRadius.circular(25)),
      child: Center(
          child: Text(
        mainText,
        style: TextStyle(
            color: Secondary,
            fontSize: screenWidth * 0.04,
            fontWeight: FontWeight.w400),
      )),
    ),
  );
}

Widget editableButton(double screenWidth, double screenHeight, String mainText,
    Color containerColor, Color TextColor, double fontSize) {
  return Container(
    width: screenWidth,
    height: screenHeight,
    decoration: BoxDecoration(
        color: containerColor,
        border: Border.all(color: primaryColor),
        borderRadius: BorderRadius.circular(25)),
    child: Center(
        child: Text(
      mainText,
      style: TextStyle(
          color: TextColor, fontSize: fontSize, fontWeight: FontWeight.w400),
    )),
  );
}
