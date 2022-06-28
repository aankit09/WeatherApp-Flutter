import 'package:flutter/material.dart';
import 'package:weather_app/activity/home.dart';
import 'package:weather_app/activity/loading.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      "/": (context) => Loading(),
      "/home": (context) => Home(),
      "/loading": (context) => Loading(),
    },
  ));
}
