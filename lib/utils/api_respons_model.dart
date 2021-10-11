import 'dart:convert';

import 'package:optimum_music/constants/dummy.dart';

class APIResponse {
  String? gender;
  String? age;
  String? ethnicity;
  List<String>? recommendations;

  APIResponse(
      {required this.gender,
      required this.age,
      required this.ethnicity,
      required this.recommendations});

  factory APIResponse.fromJson(Map<String, dynamic> json) {
    return APIResponse(
        gender: json['Gender'],
        age: json['Age'],
        ethnicity: json['Ethnicity'],
        recommendations: json['Recommendations'].cast<String>());
  }
}

class APICall {
  Future<APIResponse> aPICall() async {
    final respons = jsonR;
    await Future.delayed(Duration(seconds: 1));
    return APIResponse.fromJson(json.decode(respons));
  }
}
