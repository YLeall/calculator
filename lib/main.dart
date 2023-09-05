import 'package:calculator/calculator_screen.dart';
import 'package:calculator/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'calculator_controller.dart';

void main() async{
  Get.put(CalculatorController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora',
      theme: lightTheme,
      darkTheme: darkTheme,
      home: CalculatorScreen(),
    );
  }
}
