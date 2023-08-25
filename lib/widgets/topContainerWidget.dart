import 'package:flutter/material.dart';

Widget TopContainerWidget(double marg,double pad,double width,double heigth,Color bgColor,String url) {
  return Container(
    margin: EdgeInsets.all(marg),
    padding: EdgeInsets.all(pad),
    width: width,
    height: heigth,
    decoration: BoxDecoration(
        color: bgColor, 
        image: DecorationImage(
          image: NetworkImage(url),
          )
      ),
  );
}
