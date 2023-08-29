import 'package:get/get.dart';

class CalculatorController extends GetxController {
  RxString numberScreen = '0'.obs;
  RxString lastNumberScreen = '0'.obs;

  final listNumbersScreen = [];
  List<String> ola = [];
  List<String> oola = [];

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
          print(convertido);
        }
        print(oola);
        // for (String teste in oola) {
        //   print(teste);
        // }
        break;

      default:
    }

    numberScreen.value =
        listNumbersScreen.isEmpty ? '0' : listNumbersScreen.join("");

    // for (String teste in listNumbersScreen) {
    //   print(teste);
    //   if (teste != '+' && teste != '-' && teste != '*' && teste != '/') {
    //     ola.add(teste);
    //   } else if (teste == '+') {}
    // }

    ola = numberScreen.split(RegExp(r'[+-/x]'));
    //print(ola);

    oola = numberScreen.split(RegExp(r'[0123456789]'));
    //print(oola);

    for (String ui in oola) {
      if (ui!='') {
        print(ui);
      }
      
    }

    //
  }
}
