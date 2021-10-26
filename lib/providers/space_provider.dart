import 'dart:convert';

import 'package:cozy/models/space.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SpaceProvider extends ChangeNotifier {
  getRecommendedSpaces() async {
    var url = Uri.parse('https://bwa-cozy.herokuapp.com/recommended-spaces');
    var result = await http.get(url);

    print("Status Code = " + result.statusCode.toString());

    if (result.statusCode == 200) {
      List data = jsonDecode(result.body);
      print(data);
      List<Space> spaces = data.map((item) => Space.fromJson(item)).toList();
      print(spaces[0].name);
      return spaces;
    } else {
      return <Space>[];
    }
  }
}
