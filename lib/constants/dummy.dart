import 'dart:convert';

import 'package:optimum_music/utils/models.dart';

final demographic = {
  "Gender": "male",
  "Age": "133",
  "Ethnicity": "white",
  "Recommendations": [
    "morcheeba",
    "radiohead",
    "led zeppelin",
    "king diamond",
    "live",
    "solitary experiments",
    "in flames",
    "ian moss",
    "gipsy kings",
    "fatboy slim"
  ]
};
final emotion = {
  "Emotion": "Sad",
  "Recommendations": [
    "radiohead",
    "damien rice",
    "iron & wine",
    "rammstein",
    "tori amos",
    "john mayer",
    "sarah mclachlan",
    "elliott smith",
    "underoath",
    "lil' wayne",
    "blind guardian",
    "nick drake",
    "red hot chili peppers",
    "dream theater",
    "death cab for cutie"
  ]
};
final activity = {
  "Activity": "Walk",
  "Recommendations": [
    "maroon 5",
    "artic monkeys",
    "Rookantha Gunathilake",
    "linkin park",
    "coldplay",
    "Backstreet Boys",
    "lil' wayne",
    "Justin Bieber"
  ]
};
final demographicR = json.encode(demographic);
final emotionR = json.encode(emotion);
final activityR = json.encode(activity);
