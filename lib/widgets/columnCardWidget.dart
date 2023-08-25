import 'package:ecommerce/widgets/textWidget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_icons/line_icons.dart';

import 'InkWellWidget.dart';
import 'containerWidget.dart';
import 'iconWidget.dart';

Widget ColumnCardWidget(String url,double width,double height, String title, String price) {
  return SingleChildScrollView(
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            height: height/2.5,
            width: width,
            decoration: BoxDecoration(
              
              image: DecorationImage(
                
                image: NetworkImage(url),
                // scale: 0.5,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 5, left: 5),
          child: Align(
            alignment: Alignment.centerLeft,
            child: TextWidget(title, Colors.black, 10, FontWeight.w400,3),
          ),
        ),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          
                Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: TextWidget("$price cf", Colors.redAccent, 13, FontWeight.w700,3),
              ),
          ),
  
          InkWelWidget( ContainerWidget(5.0, 8.0, 8.0, Colors.grey.shade300,
                                IconWidget(FontAwesomeIcons.cartPlus, Colors.black, 20))),
        ],
       )
      ],
    ),
  );
}
