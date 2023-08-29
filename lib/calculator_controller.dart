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
  int controleDeLimpar = 0;

  void calculator({
    required int number,
  }) {
    // Mostrando na tela

    switch (number) {
      case 0:
        listNumbersScreen.clear();
        numbersCut.clear();
        //lastNumberScreen.value = resultCalculator.toString();
        lastNumberScreen.value = '0';
        controleDeLimpar = 1;
        break;
      case 1:
        listNumbersScreen.add('()');
        lastNumberScreen.value = '0';
        break;
      case 2:
        listNumbersScreen.add('%');
        lastNumberScreen.value = '0';
        break;
      case 3:
        listNumbersScreen[listNumbersScreen.length - 1] == '+'
            ? null
            : listNumbersScreen.add('+');

        if (resultCalculator != 0 && controleDeLimpar == 0) {
          listNumbersScreen.clear();
          listNumbersScreen.add(resultCalculator);
          listNumbersScreen.add('+');
          numbersCut.clear();
          controleDeLimpar = 1;
        }

        break;
      case 4:
        listNumbersScreen.add('1');
        lastNumberScreen.value = '0';
        if (resultCalculator != 0 && controleDeLimpar == 0) {
          listNumbersScreen.clear();
          listNumbersScreen.add(resultCalculator);
          listNumbersScreen.add('1');
          numbersCut.clear();
          controleDeLimpar = 1;
        }
        break;
      case 5:
        listNumbersScreen.add('2');
        lastNumberScreen.value = '0';
        if (resultCalculator != 0 && controleDeLimpar == 0) {
          listNumbersScreen.clear();
          listNumbersScreen.add(resultCalculator);
          listNumbersScreen.add('2');
          numbersCut.clear();
          controleDeLimpar = 1;
        }
        break;
      case 6:
        listNumbersScreen.add('3');
        lastNumberScreen.value = '0';
        if (resultCalculator != 0 && controleDeLimpar == 0) {
          listNumbersScreen.clear();
          listNumbersScreen.add(resultCalculator);
          listNumbersScreen.add('3');
          numbersCut.clear();
          controleDeLimpar = 1;
        }
        break;
      case 7:
        listNumbersScreen.add('-');
        if (resultCalculator != 0 && controleDeLimpar == 0) {
          listNumbersScreen.clear();
          listNumbersScreen.add(resultCalculator);
          listNumbersScreen.add('-');
          numbersCut.clear();
          controleDeLimpar = 1;
        }
        break;
      case 8:
        listNumbersScreen.add('4');
        lastNumberScreen.value = '0';
        if (resultCalculator != 0 && controleDeLimpar == 0) {
          listNumbersScreen.clear();
          listNumbersScreen.add(resultCalculator);
          listNumbersScreen.add('4');
          numbersCut.clear();
          controleDeLimpar = 1;
        }
        break;
      case 9:
        listNumbersScreen.add('5');
        lastNumberScreen.value = '0';
        if (resultCalculator != 0 && controleDeLimpar == 0) {
          listNumbersScreen.clear();
          listNumbersScreen.add(resultCalculator);
          listNumbersScreen.add('5');
          numbersCut.clear();
          controleDeLimpar = 1;
        }
        break;
      case 10:
        listNumbersScreen.add('6');
        lastNumberScreen.value = '0';
        if (resultCalculator != 0 && controleDeLimpar == 0) {
          listNumbersScreen.clear();
          listNumbersScreen.add(resultCalculator);
          listNumbersScreen.add('6');
          numbersCut.clear();
          controleDeLimpar = 1;
        }
        break;
      case 11:
        listNumbersScreen.add('x');
        if (resultCalculator != 0 && controleDeLimpar == 0) {
          listNumbersScreen.clear();
          listNumbersScreen.add(resultCalculator);
          listNumbersScreen.add('x');
          numbersCut.clear();
          controleDeLimpar = 1;
        }
        break;
      case 12:
        listNumbersScreen.add('7');
        lastNumberScreen.value = '0';
        if (resultCalculator != 0 && controleDeLimpar == 0) {
          listNumbersScreen.clear();
          listNumbersScreen.add(resultCalculator);
          listNumbersScreen.add('7');
          numbersCut.clear();
          controleDeLimpar = 1;
        }
        break;
      case 13:
        listNumbersScreen.add('8');
        lastNumberScreen.value = '0';
        if (resultCalculator != 0 && controleDeLimpar == 0) {
          listNumbersScreen.clear();
          listNumbersScreen.add(resultCalculator);
          listNumbersScreen.add('8');
          numbersCut.clear();
          controleDeLimpar = 1;
        }
        break;
      case 14:
        listNumbersScreen.add('9');
        lastNumberScreen.value = '0';
        if (resultCalculator != 0 && controleDeLimpar == 0) {
          listNumbersScreen.clear();
          listNumbersScreen.add(resultCalculator);
          listNumbersScreen.add('9');
          numbersCut.clear();
          controleDeLimpar = 1;
        }
        break;
      case 15:
        listNumbersScreen.add('/');
        if (resultCalculator != 0 && controleDeLimpar == 0) {
          listNumbersScreen.clear();
          listNumbersScreen.add(resultCalculator);
          listNumbersScreen.add('/');
          numbersCut.clear();
          controleDeLimpar = 1;
        }
        break;
      case 16:
        listNumbersScreen.isEmpty ? null : listNumbersScreen.removeLast();
        break;
      case 17:
        if (numberScreen.value == '0') {
          return;
        }
        listNumbersScreen.add('0');
        lastNumberScreen.value = '0';
        if (resultCalculator != 0 && controleDeLimpar == 0) {
          listNumbersScreen.clear();
          listNumbersScreen.add(resultCalculator);
          listNumbersScreen.add('0');
          numbersCut.clear();
          controleDeLimpar = 1;
        }
        break;
      case 18:
        if (numberScreen.value == '0') {
          listNumbersScreen.add('0');
        } else if (listNumbersScreen.last == '.') {
          return;
        }
        listNumbersScreen.add('.');
        break;
      case 19:
        if (numberScreen.value == '0') {
          return;
        }

        controleDeLimpar = 0;
        //print(listNumbersScreen);
        print(ola);

        lastNumberScreen.value = numberScreen.value;
        lastNumberScreen.value = '${lastNumberScreen.value} =';
        for (String teste in ola) {
          //print(teste);

          // if (teste != '') {
          //   final int convertido = teste != "" ? int.parse(teste) : 0;
          //   //print(convertido);
          //   numbersCut.add(convertido);
          // }
          final int convertido = teste != "" ? int.parse(teste) : 0;
          //print(convertido);
          numbersCut.add(convertido);
        }
        for (String ui in oola) {
          if (ui != '') {
            operadores.add(ui);
          }
        }

        print(numbersCut);

        for (int i = 0; i <= numbersCut.length; i++) {
          final eita = operadores.isEmpty ? null : operadores.first;
          //print(eita);

          if (eita == '+') {
            resultCalculator = numbersCut[0] + numbersCut[1];
            numbersCut.removeRange(0, 2);
            numbersCut.insert(0, resultCalculator);
            //print(resultCalculator);
            print(numbersCut);
          }

          if (eita == '-') {
            resultCalculator = numbersCut[0] - numbersCut[1];
            numbersCut.removeRange(0, 2);
            numbersCut.insert(0, resultCalculator);
          }

          if (eita == 'x') {
            resultCalculator = numbersCut[0] * numbersCut[1];
            numbersCut.removeRange(0, 2);
            numbersCut.insert(0, resultCalculator);
          }

          if (eita == '/') {
            resultCalculator = numbersCut[0] * numbersCut[1];
            numbersCut.removeRange(0, 2);
            numbersCut.insert(0, resultCalculator);
          }

          operadores.isEmpty ? null : operadores.removeAt(0);
        }
        break;

      default:
    }

    numberScreen.value =
        listNumbersScreen.isEmpty ? '0' : listNumbersScreen.join("");

    if (number == 19) {
      numberScreen.value = resultCalculator.toString();
    }

    ola = numberScreen.split(RegExp(r'[+-/x]'));
    //print(ola);

    oola = numberScreen.split(RegExp(r'[0123456789]'));
    //print(oola);

    //
  }
}
