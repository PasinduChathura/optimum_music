import 'dart:convert';

final mapData = {
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
final jsonR = json.encode(mapData);
