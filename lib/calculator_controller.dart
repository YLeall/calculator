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
  int controleDeParenteses = 0;
  List<String> listParenteses = [];
  List<String> listNumbersAndOpDentroParenteses = [];
  String junta = '';
  int dentroParenteses = 0;
  int metadeListParenteses = 0;

  void calculator({
    required int number,
  }) {
    // Mostrando na tela

    switch (number) {
      case 0:
        listNumbersScreen.clear();
        numbersCut.clear();
        listParenteses.clear();
        listNumbersAndOpDentroParenteses.clear();
        metadeListParenteses = 0;

        //lastNumberScreen.value = resultCalculator.toString();
        lastNumberScreen.value = '0';
        controleDeLimpar = 1;
        break;
      case 1:
        if (listNumbersScreen.isNotEmpty) {
          if (listNumbersScreen.last == junta) {
            listNumbersScreen.removeLast();
            //print('removi');
          }
        }
        listParenteses.insert(0, '(');

        listParenteses.insert(
            listParenteses.length == 1 ? 1 : listParenteses.length - 1, ')');
        junta = listParenteses.join("");

        listNumbersScreen.add(junta);
        lastNumberScreen.value = '0';
        break;
      case 2:
        listNumbersScreen.add('%');
        lastNumberScreen.value = '0';
        break;
      case 3:
        // listNumbersScreen[listNumbersScreen.length - 1] == '+'
        //     ? null
        //     : listNumbersScreen.add('+');

        if (listNumbersScreen.isNotEmpty) {
          if (listNumbersScreen.last == junta) {
            if (listNumbersAndOpDentroParenteses.isEmpty ||
                listNumbersAndOpDentroParenteses.last == '+') {
              return;
            }
            listNumbersAndOpDentroParenteses.add('+');
            //print(listNumbersAndOpDentroParenteses);
            final juntaListNumbersAndOpDentroParenteses =
                listNumbersAndOpDentroParenteses.join("");
            //print(juntaListNumbersAndOpDentroParenteses);
            metadeListParenteses == 0
                ? null
                : listParenteses.removeAt(metadeListParenteses);
            metadeListParenteses = (listParenteses.length / 2).round();
            //print(metadeListParenteses);
            listParenteses.insert(
                metadeListParenteses, juntaListNumbersAndOpDentroParenteses);
            //print(listParenteses);
            //print(listParenteses.length);
            junta = listParenteses.join("");
            listNumbersScreen.removeLast();
            listNumbersScreen.add(junta);
            dentroParenteses = 1;
            //print('oi');
          }

          if (listNumbersScreen.last == '+') {
            return;
          }
        }

        if (listNumbersScreen.isEmpty) {
          dentroParenteses = 0;
        }

        if (dentroParenteses == 0) {
          if (numberScreen.value == '0') {
            listNumbersScreen.add('0');
            listNumbersScreen.add('+');
          } else {
            listNumbersScreen.add('+');
          }
          //print('ola');
        }

        if (resultCalculator != 0 && controleDeLimpar == 0) {
          listNumbersScreen.clear();
          listNumbersScreen.add(resultCalculator);
          listNumbersScreen.add('+');
          numbersCut.clear();
          controleDeLimpar = 1;
        }

        break;
      case 4:
        //
        if (listNumbersScreen.isNotEmpty) {
          if (listNumbersScreen.last == junta) {
            listNumbersAndOpDentroParenteses.add('1');
            //print(listNumbersAndOpDentroParenteses);

            final juntaListNumbersAndOpDentroParenteses =
                listNumbersAndOpDentroParenteses.join("");
            //print(juntaListNumbersAndOpDentroParenteses);

            metadeListParenteses == 0
                ? null
                : listParenteses.removeAt(metadeListParenteses);
            metadeListParenteses = (listParenteses.length / 2).round();
            //print(metadeListParenteses);

            listParenteses.insert(
                metadeListParenteses, juntaListNumbersAndOpDentroParenteses);
            //print(listParenteses);
            //rint(listParenteses.length);

            junta = listParenteses.join("");
            listNumbersScreen.removeLast();
            listNumbersScreen.add(junta);
            dentroParenteses = 1;
            //print('oi');
          }
        }

        if (listNumbersScreen.isEmpty) {
          dentroParenteses = 0;
        }

        if (dentroParenteses == 0) {
          listNumbersScreen.add('1');
          //print('ola');
        }

        lastNumberScreen.value = '0';

        if (resultCalculator != 0 && controleDeLimpar == 0) {
          listNumbersScreen.clear();
          listNumbersScreen.add(resultCalculator);
          listNumbersScreen.add('1');
          numbersCut.clear();
          controleDeLimpar = 1;
          //print('caiu aqui');
        }

        //print(listNumbersScreen);

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
        //

        if (numberScreen.value == '0') {
          listParenteses.clear();
        }

        if (listNumbersScreen.isNotEmpty) {
          //print('1 if');
          if (listNumbersScreen.last == junta &&
              numberScreen.value != '()' &&
              junta != '') {
            if (listNumbersAndOpDentroParenteses.isNotEmpty) {
              listNumbersAndOpDentroParenteses.removeLast();
              final juntaListNumbersAndOpDentroParenteses =
                  listNumbersAndOpDentroParenteses.join("");
              metadeListParenteses == 0
                  ? null
                  : listParenteses.removeAt(metadeListParenteses);
              metadeListParenteses = (listParenteses.length / 2).round();
              listParenteses.insert(
                  metadeListParenteses, juntaListNumbersAndOpDentroParenteses);
              junta = listParenteses.join("");
              listNumbersScreen.removeLast();
              listNumbersScreen.add(junta);
              dentroParenteses = 1;
              numberScreen.value =
                  listNumbersScreen.isEmpty ? '0' : listNumbersScreen.join("");
              return;
            }
            final cort = junta.split('');
            cort.removeAt(0);
            cort.isEmpty ? null : cort.removeLast();
            final juntaCort = cort.join('');
            listNumbersScreen.removeLast();
            listNumbersScreen.add(juntaCort);
            listParenteses.clear();
            junta = juntaCort;
            controleDeParenteses = 1;
            //print('2 if');
          }
        }

        if (resultCalculator != 0 && controleDeLimpar == 0) {
          listNumbersScreen.clear();
          numbersCut.clear();
          controleDeLimpar = 1;
        }

        if (listNumbersScreen.isNotEmpty && controleDeParenteses == 0 ||
            junta == '') {
          listNumbersScreen.isEmpty ? null : listNumbersScreen.removeLast();
          //print('3 if');
        }

        controleDeParenteses = 0;
        //
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
      //
      case 19:
        //
        // print(ola[1]);
        // print(ola[3]);
        // print(oola.indexOf('x'));

        if (numberScreen.value == '0') {
          return;
        } else if (listNumbersScreen.last == "+" ||
            listNumbersScreen.last == "-" ||
            listNumbersScreen.last == "x" ||
            listNumbersScreen.last == "/" ||
            listNumbersScreen.last == "%") {
          return;
        }

        controleDeLimpar = 0;
        //print(listNumbersScreen);
        //print(ola);

        lastNumberScreen.value = numberScreen.value;
        lastNumberScreen.value = '${lastNumberScreen.value} =';
        for (String teste in ola) {
          //print(teste);

          final int convertido = int.parse(teste);
          //final int convertido = teste != "" ? int.parse(teste) : 0;
          //print(convertido);
          numbersCut.add(convertido);
        }
        for (String ui in oola) {
          if (ui != '') {
            operadores.add(ui);
          }
        }

        for (int i = 0; i <= numbersCut.length; i++) {
          final eita = operadores.isEmpty ? null : operadores.first;
          

          if (operadores.contains('x') && eita!='x') {
            final cortarNumberScreen = numberScreen.split('');
            final firstOpX = cortarNumberScreen.indexOf('x');
            final antecessorNumber = cortarNumberScreen[firstOpX - 1];
            final sucessorNumber = cortarNumberScreen[firstOpX + 1];
            final int convertidoAntecessor = int.parse(antecessorNumber);
            final int convertidoSucessor = int.parse(sucessorNumber);
            final resultAntSuc = convertidoAntecessor * convertidoSucessor;
            final indexAntecessorNumberCut = numbersCut.indexOf(convertidoAntecessor);
            numbersCut.insert(indexAntecessorNumberCut, resultAntSuc);
            final indexAntecessorNumberCutUpdate = numbersCut.indexOf(convertidoAntecessor);
            numbersCut.removeRange(indexAntecessorNumberCutUpdate, indexAntecessorNumberCutUpdate +2);
            final indexX = operadores.indexOf('x');
            operadores.removeAt(indexX);
          }

          if (operadores.contains('/') && eita != '/') {
            final testeDiv = numberScreen.split('  ');
            print(testeDiv);
            print(numbersCut);
            print(operadores);
            
            

            final cortarNumberScreen = numberScreen.split('');
            //print(cortarNumberScreen);

            final firstOpX = cortarNumberScreen.indexOf('/');
            //print(firstOpX);
            final antecessorNumber = cortarNumberScreen[firstOpX - 1];
            //print(antecessorNumber);
            final sucessorNumber = cortarNumberScreen[firstOpX + 1];
            //print(sucessorNumber);
            final int convertidoAntecessor = int.parse(antecessorNumber);
            final int convertidoSucessor = int.parse(sucessorNumber);
            final resultAntSuc = (convertidoAntecessor / convertidoSucessor).floor();
            //print(resultAntSuc);
            final indexAntecessorNumberCut = numbersCut.indexOf(convertidoAntecessor);
            numbersCut.insert(indexAntecessorNumberCut, resultAntSuc);
            final indexAntecessorNumberCutUpdate = numbersCut.indexOf(convertidoAntecessor);
            numbersCut.removeRange(indexAntecessorNumberCutUpdate,indexAntecessorNumberCutUpdate + 2);
            final indexX = operadores.indexOf('/');
            operadores.removeAt(indexX);
          }


          //*
          if (eita == '+') {
            resultCalculator = numbersCut[0] + numbersCut[1];
            numbersCut.removeRange(0, 2);
            numbersCut.insert(0, resultCalculator);
            //print(resultCalculator);
            //print(numbersCut);
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
            resultCalculator = (numbersCut[0] / numbersCut[1]).floor();
            numbersCut.removeRange(0, 2);
            numbersCut.insert(0, resultCalculator);
          }
          //*//

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
