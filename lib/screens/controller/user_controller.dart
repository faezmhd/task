import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:newone/screens/model/user_model.dart';


class ApiController2 extends ChangeNotifier{
  Future<MyUserModel?> getData() async {
    try {
      var api = 'https://dummyjson.com/users';
      var url = Uri.parse(api);
      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        MyUserModel data = MyUserModel.fromJson(json);

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