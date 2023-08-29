import 'package:calculator/button_tile.dart';
import 'package:calculator/calculator_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculatorScreen extends StatelessWidget {
  CalculatorScreen({super.key});

  final List<String> listNameButton = [
    'AC',
    '( )',
    '%',
    '+',
    '1',
    '2',
    '3',
    '-',
    '4',
    '5',
    '6',
    'x',
    '7',
    '8',
    '9',
    '/',
    '<-',
    '0',
    '.',
    '=',
  ];

  final Color corBase = const Color(0xFF292445);
  //Color corBase2 = const Color(0xFF121212);
  final calculatorController = Get.find<CalculatorController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corBase,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Obx(
                () => Text(
                  calculatorController.lastNumberScreen.value.toString(),
                  style: TextStyle(
                    color: Colors.white.withAlpha(100),
                    fontSize: 24,
                  ),
                ),
              ),

              Expanded(
                child: Obx(
                  () => Text(
                    calculatorController.numberScreen.value.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 64,
                      
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 430,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return ButtonTile(
                      nameButton: listNameButton[index],
                      index: index,
                      onPressed: (index) {
                        //print(index);
                      },
                    );
                  },
                ),
              ),

              //
            ],
          ),
        ),
      ),
    );
  }
}




