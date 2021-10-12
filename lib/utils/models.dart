import 'dart:convert';

import 'package:optimum_music/constants/dummy.dart';

class Demographic {
  String gender;
  String age;
  String ethnicity;
  List<String>? recommendations;

  Demographic(
      {required this.gender,
      required this.age,
      required this.ethnicity,
      required this.recommendations});

  factory Demographic.fromJson(Map<String, dynamic> json) {
    return Demographic(
        gender: json['Gender'],
        age: json['Age'],
        ethnicity: json['Ethnicity'],
        recommendations: json['Recommendations'].cast<String>());
  }
}

class Emotion {
  String emotion;
  List<String> recommendations;

  Emotion({required this.emotion, required this.recommendations});

  factory Emotion.fromJson(Map<String, dynamic> json) {
    return Emotion(
      emotion: json['Emotion'],
      recommendations: json['Recommendations'].cast<String>(),
    );
  }
}

class Activity {
  String activity;
  List<String> recommendations;

  Activity({required this.activity, required this.recommendations});

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      activity: json['Activity'],
      recommendations: json['Recommendations'].cast<String>(),
    );
  }
}

class APICall {
  Future<Demographic> demographic() async {
    final respons = demographicR;
    await Future.delayed(Duration(seconds: 1));
    return Demographic.fromJson(json.decode(respons));
  }
  Future<Emotion> emotion() async {
    final respons = emotionR;
    await Future.delayed(Duration(seconds: 1));
    return Emotion.fromJson(json.decode(respons));
  }

Future<Activity> activity() async {
    final respons = activityR;
    await Future.delayed(Duration(seconds: 1));
    return Activity.fromJson(json.decode(respons));
  }
}
