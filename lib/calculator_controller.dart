import 'package:get/get.dart';

class CalculatorController extends GetxController {
  RxString numberScreen = '0'.obs;
  RxString lastNumberScreen = '0'.obs;

  final listNumbersScreen = [];
  List<String> ola = []; 
  List<String> oola = [];
  List<String> operadores = [];
  List<int> numbersCut = [];
  int resultCalculator = 0;

  void calculator({
    required int number,
  }) {
    // Mostrando na tela

    switch (number) {
      case 0:
        listNumbersScreen.clear();
        break;
      case 1:
        listNumbersScreen.add('()');
        break;
      case 2:
        listNumbersScreen.add('%');
        break;
      case 3:
        listNumbersScreen[listNumbersScreen.length - 1] == '+'
            ? null
            : listNumbersScreen.add('+');
        break;
      case 4:
        listNumbersScreen.add('1');
        lastNumberScreen.value = '0';
        break;
      case 5:
        listNumbersScreen.add('2');
        lastNumberScreen.value = '0';
        break;
      case 6:
        listNumbersScreen.add('3');
        lastNumberScreen.value = '0';
        break;
      case 7:
        listNumbersScreen.add('-');
        break;
      case 8:
        listNumbersScreen.add('4');
        lastNumberScreen.value = '0';
        break;
      case 9:
        listNumbersScreen.add('5');
        lastNumberScreen.value = '0';
        break;
      case 10:
        listNumbersScreen.add('6');
        lastNumberScreen.value = '0';
        break;
      case 11:
        listNumbersScreen.add('x');
        break;
      case 12:
        listNumbersScreen.add('7');
        lastNumberScreen.value = '0';
        break;
      case 13:
        listNumbersScreen.add('8');
        lastNumberScreen.value = '0';
        break;
      case 14:
        listNumbersScreen.add('9');
        lastNumberScreen.value = '0';
        break;
      case 15:
        listNumbersScreen.add('/');
        break;
      case 16:
        listNumbersScreen.isEmpty ? null : listNumbersScreen.removeLast();
        break;
      case 17:
        listNumbersScreen.add('0');
        lastNumberScreen.value = '0';
        break;
      case 18:
        listNumbersScreen.add('.');
        break;
      case 19:
        lastNumberScreen.value = numberScreen.value;
        lastNumberScreen.value = '${lastNumberScreen.value} =';
        for (String teste in ola) {
          //print(teste);
          final int convertido = int.parse(teste);
          numbersCut.add(convertido);
          //print(convertido);
        }
        for (String ui in oola) {
          if (ui != '') {
            operadores.add(ui);
          }
        }
        for(int i = 0; i <= numbersCut.length; i++){
          final eita = operadores.first;

          if (eita=='+') {
            resultCalculator = numbersCut[i] + numbersCut[i+1];
          }

          operadores.removeAt(0);
          

        }
        
        //print(oola);
        // for (String teste in oola) {
        //   print(teste);
        // }
        break;

      default:
    }

    numberScreen.value =
        listNumbersScreen.isEmpty ? '0' : listNumbersScreen.join("");

    

    ola = numberScreen.split(RegExp(r'[+-/x]'));
    //print(ola);

    oola = numberScreen.split(RegExp(r'[0123456789]'));
    //print(oola);
    

    

    //
  }
}
