import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/app_controller.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (controller) {
        return SizedBox(
          height: 12,
          width: 280,
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
              valueIndicatorTextStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              valueIndicatorColor:  controller.activeColor,
              activeTrackColor: controller.activeColor,inactiveTrackColor: Colors.grey.withOpacity(0.2),
              thumbColor: controller.activeColor,overlayColor: controller.activeColor.withOpacity(0.2),
            ),
            child: Slider(
              value: controller.sliderValue,
              min: 0,
              max: 1,
              divisions: 2,
              label: _getSpeedLabel(controller.sliderValue),
              onChanged: (value) => controller.updateSlider(value),
            ),
          )

        );
      },
    );
  }
}
String _getSpeedLabel(double value) {
  if (value <= 0.3) return 'Slow';
  if (value <= 0.7) return 'Medium';
  return 'Fast';
}