import 'package:calculator/button_tile.dart';
import 'package:calculator/calculator_controller.dart';
import 'package:calculator/constants.dart';
import 'package:calculator/historic_tile.dart';
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
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        foregroundColor: Colors.transparent,
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
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(
                Icons.history_outlined,
                color: Theme.of(context).colorScheme.onTertiary,
                size: 35,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),

      drawer: Obx(
        () => NavigationDrawer(
          backgroundColor: Theme.of(context).colorScheme.background,
          elevation: 0,
          children: [
            //

            // const Padding(
            //   padding: EdgeInsets.symmetric(vertical: 25),
            //   child: Align(
            //     alignment: Alignment.center,
            //     child: Text(
            //       'H I S T Ó R I C O',
            //       style: TextStyle(
            //         fontSize: 20,
            //       ),
            //     ),
            //   ),
            // ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'H I S T Ó R I C O',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      calculatorController.clearListHistoric();
                    },
                    icon: const Icon(
                      Icons.delete,
                    ),
                  ),
                ],
              ),
            ),

            if (calculatorController.listHistoricModel.isEmpty) ...[
              const SizedBox(
                height: 230,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.sentiment_dissatisfied_outlined,
                  size: 50,
                ),
              ),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'V A Z I O ',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],

            // TESTAR
            ...calculatorController.listHistoricModel.map((historicTile) {
              return HistoricTile(
                operacaoName: historicTile.operacaoName,
                indexListHistoric: historicTile.id,
                resultOperacao: historicTile.resultOperacao,
              );
            }).toList(),
            //
          ],
        ),
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
                    color:
                        Theme.of(context).colorScheme.onTertiary.withAlpha(100),
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
