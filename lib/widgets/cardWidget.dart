import 'package:flutter/material.dart';

Widget CardWidget(double elevation, double width, double height, Widget cardChild,Color color, double raduis) {
  return Card(
    elevation: elevation,
    child: Container(
      width:  width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(raduis)
      ),
      child: cardChild,
    ),
  );
}
