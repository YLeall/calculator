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
  final colorTextButton = const Color(0xFF29A8FF);
  final colorBackgroundButtonDark = const Color(0xFF303136);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          borderRadius: BorderRadius.circular(16),
        ),
        child: TextButton(
          onPressed: () {
            onPressed(index);
            calculatorController.calculator(number: index);
          },
          style: ButtonStyle(
            overlayColor: MaterialStateColor.resolveWith(
              (states) =>
                  const Color.fromARGB(110, 255, 255, 255).withOpacity(0.1),
            ),
          ),
          child: Text(
            nameButton,
            style: TextStyle(
              fontSize: 32,
              color: colorTextButton,
            ),
          ),
        ),
      ),
    );
  }
}
