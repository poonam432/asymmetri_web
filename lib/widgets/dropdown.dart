import 'package:asymmetri_web/data/my_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/app_controller.dart';

class DropdownWidget extends StatelessWidget {
  const DropdownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 280,
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              blurRadius: 0,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: GetBuilder<AppController>(
          builder: (controller) {
            return DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: controller.selectedTheme,
                isExpanded: true,
                icon:  Padding(
                  padding: EdgeInsets.only(right: 18),
                  child: Transform.rotate(
                    angle: 3.14159 / 2,
                    child: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 14.0,
                      color: Colors.black,
                    ),
                  ),
                ),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                dropdownColor: Colors.grey.shade200,
                onChanged: (value) {
                  if (value != null) controller.updateTheme(value);
                },
                items: MyData.themes.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(value),
                    ),
                  );
                }).toList(),
              ),
            );
          },
        ),
      ),
    );
  }
}
