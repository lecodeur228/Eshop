import 'package:flutter/material.dart';

Widget DropDownWidget(String selectItem,Function changeValue) {
  return DropdownButton<String>(
    value: selectItem,
    
    items:  <String>['Option 1', 'Option 2', 'Option 3', 'Option 4']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    onChanged: changeValue(),
  );
}
