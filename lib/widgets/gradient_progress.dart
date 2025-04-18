import 'package:asymmetri_web/controller/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GradientProgressWidget extends StatelessWidget {
  const GradientProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (controller) {
        return Container(
          height: 18,
          width: double.infinity,
          // margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.black),
          ),
          child: Align(
            alignment:
            controller.isReversed ? Alignment.centerRight : Alignment.centerLeft,
            child: FractionallySizedBox(
              widthFactor: controller.animationValue,
              child: Container(
                decoration: BoxDecoration(
                  gradient: controller.activeGradient,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
