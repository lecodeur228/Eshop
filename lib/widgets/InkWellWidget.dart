import 'package:flutter/material.dart';

Widget InkWelWidget(Widget child) {
  return InkWell(
    onTap: () {
      print('ok');
    },
    child: child,
  );
}
