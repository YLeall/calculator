import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'calculator_controller.dart';

class ButtonTile extends StatelessWidget {
  ButtonTile({
    super.key,
    required this.nameButton,
    required this.onPressed,
    required this.index,
  });
  final String nameButton;
  final int index;
  final Function(int teste) onPressed;

  final calculatorController = Get.find<CalculatorController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: () {
          onPressed(index);
          calculatorController.calculator(number: index);
        },
        child: Text(
          nameButton,
          style: const TextStyle(
            fontSize: 32,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
