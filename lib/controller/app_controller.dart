import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/my_data.dart';

class AppController extends GetxController {
  String selectedTheme = 'Purple';
  double sliderValue = 0.5;
  bool isReversed = false;
final TextEditingController textEditingController = TextEditingController();

  void updateTheme(String theme) {
    selectedTheme = theme;
    update(); // triggers rebuild
  }

  void updateSlider(double value) {
    sliderValue = value;
    update();
  }

  Color get activeColor => MyData.themeColors[selectedTheme]!;
  Gradient get activeGradient => MyData.themeGradients[selectedTheme]!;

  void toggleReverse(bool value) {
    isReversed = value;
    update();
  }

  double animationValue = 0.0;

  void animateProgress() async {
    while (true) {
      double speed = 0.008 + 0.03 * (sliderValue * sliderValue);
      animationValue += speed;
      if (animationValue >= 1.0) animationValue = 0.0;
      update();
      await Future.delayed(const Duration(milliseconds: 12));
    }
  }

  @override
  void onInit() {
    animateProgress();
    super.onInit();
  }

}
