
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Data {


  final String urlApi = "https://fakestoreapi.com/products";

    Future<List> getApiData() async {
    final response = await http.get(Uri.parse(Data().urlApi));
    return jsonDecode(response.body);
  }
}
