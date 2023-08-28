import 'package:calculator/calculator_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'calculator_controller.dart';

void main() {

  Get.put(CalculatorController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Desenvolvendo calculadora',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
        ),
        useMaterial3: true,
      ),
      home: CalculatorScreen(),
    );
  }
}
