import 'package:flutter/material.dart';

Widget ContainerWidget(double marg,double pad,double raduis, Color bgColor,Widget childContainer) {
  return Container(
    margin: EdgeInsets.all(marg),
    padding: EdgeInsets.all(pad),
    decoration: BoxDecoration(
        color: bgColor, 
        borderRadius: BorderRadius.circular(raduis),
      ),
    child: childContainer,
  );
}
