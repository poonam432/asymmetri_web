import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app.dart';
import 'controller/app_controller.dart';

void main() {
  Get.put(AppController());
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainUI(),
    );
  }
}