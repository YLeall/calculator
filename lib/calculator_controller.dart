import 'package:calculator/number_historic_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculatorController extends GetxController {
  RxString numberScreen = '0'.obs;
  RxString lastNumberScreen = '0'.obs;
  RxList<NumberHistoricModel> listHistoricModel = <NumberHistoricModel>[].obs;

  final listNumbersScreen = [];
  List<String> ola = [];
  List<String> oola = [];
  List<String> operadores = [];
  List numbersCut = [];
  num resultCalculator = 0;
  int controleDeLimpar = 0;
  int controleDeParenteses = 0;
  List<String> listParenteses = [];
  List<String> listNumbersAndOpDentroParenteses = [];
  String junta = '';
  int dentroParenteses = 0;
  int metadeListParenteses = 0;
  double fontSize = 64;
  int contador = 0;
  bool controllerOfBugs=false;

  ScrollController scrollController = ScrollController();

  RxBool switchValue = true.obs;

  void changeTheme(bool isTheme) {
    switchValue.value = !switchValue.value;
    if (isTheme == true) {
      Get.changeThemeMode(ThemeMode.dark);
    } else {
      Get.changeThemeMode(ThemeMode.light);
    }
  }

  void clearListHistoric() {
    listHistoricModel.clear();
    contador=0;
  }

  void changeNumberScreenHistoric({required String numberHistoric,}){
    numberScreen.value = numberHistoric;
    final quebrando = numberScreen.split('');
    ola = numberScreen.split(RegExp(r'[()%x/+-]'));
    oola = numberScreen.split(RegExp(r'[()0123456789.]'));
    numbersCut.clear();
    listNumbersScreen.clear();
    listNumbersScreen.addAll(quebrando);
    resultCalculator=0;
  }

  void scrollToBottom() {
    //double initialPosition = scrollController.offset;
    //print(initialPosition);
    scrollController.animateTo(
      scrollController.position.maxScrollExtent + 28,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );

    if (numberScreen.value == '0') {
      scrollController.jumpTo(0);
    }
  }

  void setFontSize({
    required int sizeListNumberScreen,
  }) {
    switch (sizeListNumberScreen) {
      case 9:
        fontSize = 60;
        break;
      case 10:
        fontSize = 56;
        break;
      case 11:
        fontSize = 54;
        break;
      case 12:
        fontSize = 50;
        break;
      case 13:
        fontSize = 48;
        break;
      default:
    }
  }

  void calculator({
    required int number,
  }) {
    // Mostrando na tela

    switch (number) {
      case 0:
        clearCalculator();
        break;
      case 1:
        setLogicParentheses();
        break;
      case 2:
        setLogicOperatorButton(operator: '%');
        break;
      case 3:
        setLogicOperatorButton(operator: '+');
        break;
      case 4:
        setLogicNumberButton(number: '1');
        break;
      case 5:
        setLogicNumberButton(number: '2');
        break;
      case 6:
        setLogicNumberButton(number: '3');
        break;
      case 7:
        setLogicOperatorButton(operator: '-');
        break;
      case 8:
        setLogicNumberButton(number: '4');
        break;
      case 9:
        setLogicNumberButton(number: '5');
        break;
      case 10:
        setLogicNumberButton(number: '6');
        break;
      case 11:
        setLogicOperatorButton(operator: 'x');
        break;
      case 12:
        setLogicNumberButton(number: '7');
        break;
      case 13:
        setLogicNumberButton(number: '8');
        break;
      case 14:
       setLogicNumberButton(number: '9');
        break;
      case 15:
        setLogicOperatorButton(operator: '/');
        break;
      case 16:
        setLogicDeleteNumber();
        break;
      case 17:
        setLogicZeroNumberButton();
        break;
      case 18:
        setLogicPointButton();
        break;
      case 19:
        setLogicResultCalculator();
        break;
      default:
    }

    if (resultCalculator.isFinite && controllerOfBugs == false) {
      numberScreen.value = listNumbersScreen.isEmpty ? '0' : listNumbersScreen.join("");
    }

    if (number == 19 && controllerOfBugs == false) {
      //
      contador += 1;
      listHistoricModel.add(
        NumberHistoricModel(
          id: contador,
          operacaoName: numberScreen.value,
          resultOperacao: resultCalculator.toString(),
        ),
      );

      numberScreen.value = resultCalculator.toString();
      //
    }

    ola = numberScreen.split(RegExp(r'[()%x/+-]'));
    oola = numberScreen.split(RegExp(r'[()0123456789.]'));
    controllerOfBugs = false;
    setFontSize(sizeListNumberScreen: listNumbersScreen.length);
    scrollToBottom();

    //
  }


  void setLogicNumberButton({required String number,}) {
    //

    if (listNumbersScreen.isNotEmpty) {
      if (listNumbersScreen.last == junta) {
        if (listNumbersAndOpDentroParenteses.isNotEmpty) {
          if (listNumbersAndOpDentroParenteses.last == '%') {
            listNumbersAndOpDentroParenteses.add('x');
            listNumbersAndOpDentroParenteses.add(number);
            final juntaListNumbersAndOpDentroParenteses = listNumbersAndOpDentroParenteses.join("");
            metadeListParenteses == 0 ? null : listParenteses.removeAt(metadeListParenteses);
            metadeListParenteses = (listParenteses.length / 2).round();
            listParenteses.insert(metadeListParenteses, juntaListNumbersAndOpDentroParenteses);
            junta = listParenteses.join("");
            listNumbersScreen.removeLast();
            listNumbersScreen.add(junta);
            numberScreen.value = listNumbersScreen.join();
            return;
          }
        }
        listNumbersAndOpDentroParenteses.add(number);
        final juntaListNumbersAndOpDentroParenteses = listNumbersAndOpDentroParenteses.join(""); 
        metadeListParenteses == 0 ? null : listParenteses.removeAt(metadeListParenteses);
        metadeListParenteses = (listParenteses.length / 2).round();
        listParenteses.insert(metadeListParenteses, juntaListNumbersAndOpDentroParenteses);
        junta = listParenteses.join("");
        listNumbersScreen.removeLast();
        listNumbersScreen.add(junta);
        dentroParenteses = 1;
      }
    }

    if (listNumbersScreen.isEmpty || junta=='') {
      dentroParenteses = 0;
    }

    int controlPorcentagem = 0;
    if (dentroParenteses == 0) {
      if (listNumbersScreen.isNotEmpty) {
        if (listNumbersScreen.last == '%') {
          listNumbersScreen.add('x');
          listNumbersScreen.add(number);
          controlPorcentagem = 1;
        }
      }
      if (controlPorcentagem == 0) {
        listNumbersScreen.add(number);
      }
      controlPorcentagem = 0;
    }
    lastNumberScreen.value = '0';
    if (resultCalculator != 0 && controleDeLimpar == 0) {
      if (resultCalculator.isInfinite) {
        listNumbersScreen.clear();
        listNumbersScreen.add(number);
        numbersCut.clear();
        controleDeLimpar = 1;
        numberScreen.value = listNumbersScreen.join();
        resultCalculator=0;
        return;
      }
      listNumbersScreen.clear();
      listNumbersScreen.add(resultCalculator);
      listNumbersScreen.add(number);
      numbersCut.clear();
      controleDeLimpar = 1;
    }
    //
  }

  void setLogicOperatorButton({required String operator,}){

    if (resultCalculator.isInfinite) {
      return;
    }

    if (listNumbersScreen.isNotEmpty) {
      if (listNumbersScreen.last == junta) {
        if (listNumbersAndOpDentroParenteses.isEmpty || listNumbersAndOpDentroParenteses.last == operator) {
          return;
        }
        String catchLastNumberScreenInsideParentheses = listNumbersAndOpDentroParenteses.last;
        bool isNumLastNumberScreenInsideParentheses = catchLastNumberScreenInsideParentheses.isNum;

        if (listNumbersAndOpDentroParenteses.last != operator && !isNumLastNumberScreenInsideParentheses &&
            catchLastNumberScreenInsideParentheses != '%') {
          listNumbersAndOpDentroParenteses.removeLast();
          listNumbersAndOpDentroParenteses.add(operator);
          final juntaListNumbersAndOpDentroParenteses = listNumbersAndOpDentroParenteses.join("");
          metadeListParenteses == 0 ? null : listParenteses.removeAt(metadeListParenteses);
          metadeListParenteses = (listParenteses.length / 2).round();
          listParenteses.insert(metadeListParenteses, juntaListNumbersAndOpDentroParenteses);
          junta = listParenteses.join("");
          listNumbersScreen.removeLast();
          listNumbersScreen.add(junta);
          numberScreen.value = listNumbersScreen.join();
          return;
        }
  
        listNumbersAndOpDentroParenteses.add(operator);
        final juntaListNumbersAndOpDentroParenteses = listNumbersAndOpDentroParenteses.join("");
        metadeListParenteses == 0 ? null : listParenteses.removeAt(metadeListParenteses);
        metadeListParenteses = (listParenteses.length / 2).round();
        listParenteses.insert(metadeListParenteses, juntaListNumbersAndOpDentroParenteses);
        junta = listParenteses.join("");
        listNumbersScreen.removeLast();
        listNumbersScreen.add(junta);
        dentroParenteses = 1;
      }
      
      String catchLastNumberScreen = listNumbersScreen.last;
      bool isNumLastNumberScreen = catchLastNumberScreen.isNum;

      if (listNumbersScreen.last != operator && !isNumLastNumberScreen && dentroParenteses == 0 && catchLastNumberScreen!='%') {
        listNumbersScreen.removeLast();
        listNumbersScreen.add(operator);
      }

      if (listNumbersScreen.last == operator) {
        return;
      }
    }

    if (listNumbersScreen.isEmpty) {
      dentroParenteses = 0;
    }

    if (dentroParenteses == 0) {
      if (numberScreen.value == '0') {
        listNumbersScreen.add('0');
        listNumbersScreen.add(operator);
      } else {
        listNumbersScreen.add(operator);
      }
    }

    if (resultCalculator != 0 && controleDeLimpar == 0) {
      listNumbersScreen.clear();
      listNumbersScreen.add(resultCalculator);
      listNumbersScreen.add(operator);
      numbersCut.clear();
      controleDeLimpar = 1;
    }
    //
  }

  void clearCalculator(){
    listNumbersScreen.clear();
    numbersCut.clear();
    listParenteses.clear();
    listNumbersAndOpDentroParenteses.clear();
    metadeListParenteses = 0;
    fontSize = 64;
    lastNumberScreen.value = '0';
    junta='';
    resultCalculator=0;
    controleDeLimpar = 1;
    //dentroParenteses=0;
  }

  void setLogicParentheses(){
    if (listNumbersScreen.isNotEmpty) {
      if (listNumbersScreen.last == junta) {
        listNumbersScreen.removeLast();
      }
    }
    listParenteses.insert(0, '(');
    listParenteses.insert(listParenteses.length == 1 ? 1 : listParenteses.length - 1, ')');
    junta = listParenteses.join("");
    listNumbersScreen.add(junta);
    lastNumberScreen.value = '0';
  }

  void setLogicDeleteNumber(){

    if (resultCalculator.isInfinite) {
      resultCalculator=0;
      numberScreen.value = '0';
      listNumbersScreen.clear();
      numbersCut.clear();
      return;
    }
    
    if (numberScreen.value == '0') {
      listParenteses.clear();
      fontSize = 64;
    }

    if (listNumbersScreen.isNotEmpty) {
      if (listNumbersScreen.last == junta && numberScreen.value != '()' && junta != '') {
        if (listNumbersAndOpDentroParenteses.isNotEmpty) {
          listNumbersAndOpDentroParenteses.removeLast();
          final juntaListNumbersAndOpDentroParenteses = listNumbersAndOpDentroParenteses.join("");
          metadeListParenteses == 0 ? null : listParenteses.removeAt(metadeListParenteses);
          metadeListParenteses = (listParenteses.length / 2).round();
          listParenteses.insert(metadeListParenteses, juntaListNumbersAndOpDentroParenteses);
          junta = listParenteses.join("");
          listNumbersScreen.removeLast();
          listNumbersScreen.add(junta);
          dentroParenteses = 1;
          numberScreen.value = listNumbersScreen.isEmpty ? '0' : listNumbersScreen.join("");
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
      }
    }

    if (resultCalculator != 0 && controleDeLimpar == 0) {
      listNumbersScreen.clear();
      numbersCut.clear();
      controleDeLimpar = 1;
    }

    if (listNumbersScreen.isNotEmpty && controleDeParenteses == 0 || junta == '') {
      listNumbersScreen.isEmpty ? null : listNumbersScreen.removeLast();
    }

    controleDeParenteses = 0;
    //
  }

  void setLogicResultCalculator(){
    //
   
    if (numberScreen.value == '0') {
      return;
    } 

    if (listNumbersScreen.last == "+" ||
        listNumbersScreen.last == "-" ||
        listNumbersScreen.last == "x" ||
        listNumbersScreen.last == "/" ||
        listNumbersScreen.last == "%") {
      //print('object');
      controllerOfBugs = true;
      return;
    }
     
    if (resultCalculator.isInfinite) {
      return;
    }

    String operatorFunc = listNumbersScreen[listNumbersScreen.length - 2];
    bool teste = operatorFunc == '+' || operatorFunc == '-' || operatorFunc == 'x' || operatorFunc == '/' || operatorFunc == '%';

    if(listNumbersScreen.last=='.' && teste){
      controllerOfBugs=true;
      return;
    }

    controleDeLimpar = 0;
    junta='';

    lastNumberScreen.value = numberScreen.value;
    lastNumberScreen.value = '${lastNumberScreen.value} =';

    for (String teste in ola) {
      final ponto = teste.indexOf('.');
      if (teste != "") {
        final convertido = ponto == -1 ? int.parse(teste) : double.parse(teste);
        numbersCut.add(convertido);
      }
    }

    final cortOperadorColado = oola.join();
    final cortOperadorTeste = cortOperadorColado.split('');

    for (String ui in cortOperadorTeste) {
      if (ui != '') {
        operadores.add(ui);
      }
    }

    String copyNumberScreen = numberScreen.value;

    for (int i = 0; i <= numbersCut.length; i++) {
      final eita = operadores.isEmpty ? null : operadores.first;

      if (operadores.contains('x') && eita != 'x' && eita != '%') {
        String pegarNumDoFor = '';
        List<int> listNumberMult = [];
        List<String> listRemoveAspasVazias = [];
        int resultNumbersMult = 0;
        int indexNumberDivDiferent = 0;

        final testeDiv3 = copyNumberScreen.split(RegExp(r'[()+-/]'));

        for (String tirandoAspasVazia in testeDiv3) {
          if (tirandoAspasVazia != '') {
            listRemoveAspasVazias.add(tirandoAspasVazia);
          }
        }

        for (String ii in listRemoveAspasVazias) {
          if (!ii.isNum && ii != '') {
            pegarNumDoFor = ii;
            break;
          }
          indexNumberDivDiferent += 1;
        }

        final testeDiv2 = pegarNumDoFor.split('x');

        for (String convertString in testeDiv2) {
          final int convertidoNumberDiv = int.parse(convertString);
          listNumberMult.add(convertidoNumberDiv);
        }

        for (int i = 1; i != listNumberMult.length; i++) {
          resultNumbersMult = listNumberMult[0] * listNumberMult[1];
        }

        final vvd = copyNumberScreen.replaceAll(RegExp(pegarNumDoFor), resultNumbersMult.toString());
        numbersCut.insert(indexNumberDivDiferent, resultNumbersMult);
        numbersCut.removeRange(indexNumberDivDiferent + 1, indexNumberDivDiferent + 3);
        final indexX = operadores.indexOf('x');
        operadores.removeAt(indexX);
        copyNumberScreen = vvd;
        //
      }

      if (operadores.contains('/') && eita != '/') {
        String pegarNumDoFor = '';
        List<int> listNumberDiv = [];
        int resultNumbersDiv = 0;
        int indexNumberDivDiferent = 0;

        final testeDiv3 = copyNumberScreen.split(RegExp(r'[x+-]'));

        for (String ii in testeDiv3) {
          if (!ii.isNum) {
            pegarNumDoFor = ii;
            break;
          }
          indexNumberDivDiferent += 1;
        }

        final testeDiv2 = pegarNumDoFor.split('/');

        for (String convertString in testeDiv2) {
          final int convertidoNumberDiv = int.parse(convertString);
          listNumberDiv.add(convertidoNumberDiv);
        }

        for (int i = 1; i != listNumberDiv.length; i++) {
          resultNumbersDiv = (listNumberDiv[0] / listNumberDiv[1]).floor();
        }

        final vvd = copyNumberScreen.replaceAll(RegExp(pegarNumDoFor), resultNumbersDiv.toString());

        numbersCut.insert(indexNumberDivDiferent, resultNumbersDiv);
        numbersCut.removeRange(indexNumberDivDiferent + 1, indexNumberDivDiferent + 3);
        final indexX = operadores.indexOf('/');
        operadores.removeAt(indexX);
        copyNumberScreen = vvd;
      }

      //*
      if (eita == '+') {
        resultCalculator = numbersCut[0] + numbersCut[1];
        numbersCut.removeRange(0, 2);
        numbersCut.insert(0, resultCalculator);
      }

      if (eita == '-') {
        resultCalculator = numbersCut[0] - numbersCut[1];
        numbersCut.removeRange(0, 2);
        numbersCut.insert(0, resultCalculator);
      }

      if (eita == 'x') {
        resultCalculator = numbersCut[0] * numbersCut[1];
        bool temParteDecimalZero = (resultCalculator - resultCalculator.toInt()) == 0;

        if (temParteDecimalZero) {
          resultCalculator = resultCalculator.toInt();
          numbersCut.removeRange(0, 2);
          numbersCut.insert(0, resultCalculator);
        } else {
          numbersCut.removeRange(0, 2);
          numbersCut.insert(0, resultCalculator);
        }
      }

      if (eita == '/') {
        resultCalculator = numbersCut[0] / numbersCut[1];

        if (resultCalculator.isInfinite) {
          operadores.isEmpty ? null : operadores.removeAt(0);
          return;
        }
        bool temParteDecimalZero = (resultCalculator - resultCalculator.toInt()) == 0;

        if (temParteDecimalZero) {
          resultCalculator = resultCalculator.toInt();
          numbersCut.removeRange(0, 2);
          numbersCut.insert(0, resultCalculator);
        } else {
          numbersCut.removeRange(0, 2);
          numbersCut.insert(0, resultCalculator);
        }
      }

      if (eita == '%') {
        resultCalculator = (numbersCut[0] / 100);
        final indexNumberPercentage = numbersCut.indexOf(numbersCut[0]);
        numbersCut.removeAt(indexNumberPercentage);
        numbersCut.insert(0, resultCalculator);
      }

      //*//

      operadores.isEmpty ? null : operadores.removeAt(0);
    }
    //
  }

  void setLogicZeroNumberButton(){
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
  }

  void setLogicPointButton(){
    if (numberScreen.value == '0') {
      listNumbersScreen.add('0');
    } else if (listNumbersScreen.last == '.') {
      return;
    }
    listNumbersScreen.add('.');
  }


}