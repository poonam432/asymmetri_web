import 'package:asymmetri_web/controller/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_switch.dart';


class ReverseToggleWidget extends StatelessWidget {
  const ReverseToggleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (controller) {
        return Container(
          padding: const EdgeInsets.all(10),
          width: 280,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Reverse',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: controller.activeColor,
                ),
              ),
              const SizedBox(width: 10),
              CustomSwitch(
                value: controller.isReversed,
                onChanged: controller.toggleReverse,
              ),
            ],
          ),
        );
      },
    );
  }
}


