import 'package:get/get.dart';

class CalculatorController extends GetxController {
  RxInt numberScreen = 0.obs;
  
  final teste = [];

  void calculator({
    required int number,
  }) {


    if (number == 4) {
      numberScreen.value = 1;
    }



  }
}
