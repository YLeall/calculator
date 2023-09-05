import 'package:flutter/material.dart';

//const Color.fromRGBO(23, 24, 26, 100)
//        : const Color(0xFFF7F8FB),
ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    //background: Color.fromRGBO(23, 24, 26, 100),
    onPrimaryContainer: Color(0xFF303136),
    onTertiary: Colors.white,
  ),
  scaffoldBackgroundColor: const Color.fromRGBO(23, 24, 26, 100),
  useMaterial3: true,
);

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    background: Color(0xFFF7F8FB),
    onPrimaryContainer: Color(0xFFFFFFFF),
    onTertiary: Colors.black,
  ),
  scaffoldBackgroundColor: const Color(0xFFF7F8FB),
  useMaterial3: true,
);
