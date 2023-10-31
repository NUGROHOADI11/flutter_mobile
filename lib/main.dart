import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modul/view/pages/splash.dart';
import 'controller/product_controller.dart';

void main() {
  Get.put(ProductController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroductionPage(),
    );
  }
}
