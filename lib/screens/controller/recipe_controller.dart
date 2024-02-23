import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import '../model/recipe_model.dart';

class ApiController extends ChangeNotifier{
  Future<MyUser?> getData() async {
    try {
      var api = 'https://dummyjson.com/recipes';
      var url = Uri.parse(api);
      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        MyUser data = MyUser.fromJson(json);

        return data;
      } else {
        throw Exception("some error");
      }
    } catch (e) {
      print("Exception is : $e");
    }
    return null;
  }
}