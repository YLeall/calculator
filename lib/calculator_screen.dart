import 'package:calculator/button_tile.dart';
import 'package:calculator/calculator_controller.dart';
import 'package:calculator/constants.dart';
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
  
  final calculatorController = Get.find<CalculatorController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Theme.of(context).colorScheme.background,
      //
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Switch(
          thumbIcon: thumbIcon,
          value: calculatorController.switchValue.value,
          onChanged: (value) {
            calculatorController.changeTheme(value);
          },
          activeColor: const Color(0xFF003661),
          inactiveThumbColor: const Color(0xFFD8EEFF),
          inactiveTrackColor: const Color(0xFFA9DCFD),
          trackOutlineColor: trackOutlineColor,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.history_outlined,
              color: Theme.of(context).colorScheme.onTertiary,
              size: 35,
            ),
            onPressed: () {},
          ),
        ],
      ),

      //
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
                    color:  Theme.of(context).colorScheme.onTertiary.withAlpha(100),
                    fontSize: 24,
                  ),
                ),
              ),

              const SizedBox(
                height: 60,
              ),

              Expanded(
                child: Obx(
                  () => SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    controller: calculatorController.scrollController,
                    child: Text(
                      calculatorController.numberScreen.value.toString(),
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onTertiary,
                        fontSize: calculatorController.fontSize,
                      ),
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

/*
FlutterSwitch(
            value: calculatorController.switchValue.value,
            width: 122.0,
            height: 40,
            toggleSize: 30.0,
            padding: 5,
            onToggle: (value) {
              calculatorController.changeTheme(value);
            },
            activeIcon: const Icon(
              Icons.dark_mode_outlined,
              color: Colors.black,
            ),
            inactiveIcon: const Icon(
              Icons.wb_sunny_rounded,
              color: Colors.black,
            ),
          ),
*/
