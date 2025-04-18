import 'package:flutter/material.dart';

class MyData {
  static final List<String> themes = ['Green', 'Blue', 'Red', 'Purple'];

  static final Map<String, Color> themeColors = {
    'Green': Colors.green,
    'Blue': Colors.blue,
    'Red': Colors.red,
    'Purple': Colors.purple,
  };

  static final Map<String, Gradient> themeGradients = {
    'Green': const LinearGradient(colors: [Colors.greenAccent, Colors.green]),
    'Blue': const LinearGradient(colors: [Colors.lightBlueAccent, Colors.blue]),
    'Red': const LinearGradient(colors: [Colors.redAccent, Colors.red]),
    'Purple': const LinearGradient(colors: [Colors.deepPurpleAccent, Colors.purple]),
  };
}
