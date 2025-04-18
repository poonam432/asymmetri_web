import 'package:asymmetri_web/controller/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFieldWidget extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  const TextFieldWidget({
    super.key,
    required this.label,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appController) {
        return SizedBox(
          width: 280,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: TextField(
              controller: controller,
              style: TextStyle(
                color: appController.activeColor,
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                labelText: label,
                labelStyle: TextStyle(
                  color: appController.activeColor,
                ),
                floatingLabelStyle: TextStyle(
                  color: appController.activeColor,
                  fontWeight: FontWeight.w500,
                ),
                filled: true,
                fillColor: Colors.transparent,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: appController.activeColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: appController.activeColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: appController.activeColor, width: 2),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
