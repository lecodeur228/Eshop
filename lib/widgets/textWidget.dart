import 'package:flutter/material.dart';

Widget TextWidget(String text, Color color, double size, FontWeight font,int lines) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: size,
      fontWeight: font,
    ),
    maxLines: lines,
  );
}
