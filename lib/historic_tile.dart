import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'calculator_controller.dart';

class HistoricTile extends StatelessWidget {
  HistoricTile({
    super.key,
    required this.operacaoName,
    required this.resultOperacao,
    required this.indexListHistoric,
  });

  final String operacaoName;
  final String resultOperacao;
  final int indexListHistoric;
  final calculatorController = Get.find<CalculatorController>();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        indexListHistoric.toString(),
        style: TextStyle(
          fontSize: 28,
          color: Theme.of(context).colorScheme.onTertiary
        ),
      ),
      title: Text(
        operacaoName,
        style: TextStyle(
          fontSize: 20,
          color: Theme.of(context).colorScheme.onTertiary
        ),
      ),
      subtitle: Text(
        resultOperacao,
        style: TextStyle(
          fontSize: 14,
          color: Theme.of(context).colorScheme.onTertiary
        ),
      ),
      trailing: IconButton(
        onPressed: () {
          calculatorController.changeNumberScreenHistoric(numberHistoric: operacaoName);
          Get.back();
        },
        icon: const Icon(
          Icons.arrow_forward,
        ),
      ),
    );
  }
}
