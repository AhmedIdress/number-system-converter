import 'dart:collection';

import 'dart:math';

import 'package:number_system/logic/costants.dart';

class FromDecimal{
  static String convertFromDecimalToBinary(String number) {
    bool isDouble = int.tryParse(number) == null;
    String convertResult = '';
    Queue<int> result = Queue();
    Queue<int> resultDecimal = Queue();

    if (isDouble) {
      String doub = number.split('.')[1];
      int integer = int.parse(number.split('.')[0]);
      double tempDouble = double.parse(doub) / pow(10, doub.length);
      while (tempDouble != 0) {
        if ((tempDouble * 2) >= 1) {
          resultDecimal.addLast(1);
          tempDouble = (tempDouble * 2) - 1;
        } else {
          resultDecimal.addLast(0);
          tempDouble = (tempDouble * 2);
        }
      }
      int temp = integer;
      double temp2;
      while (temp != 0) {
        result.addFirst(temp % 2);
        temp2 = temp / 2;
        temp = temp2.toInt();
      }
    }
    else {
      int temp = int.parse(number);
      double temp2;
      while (temp != 0) {
        result.addFirst(temp % 2);
        temp2 = temp / 2;
        temp = temp2.toInt();
      }
    }
    while (result.isNotEmpty) {
      convertResult += result.removeFirst().toString();
    }
    if (isDouble) {
      convertResult += '.';
      while (resultDecimal.isNotEmpty) {
        convertResult += resultDecimal.removeFirst().toString();
      }
    }
    return convertResult;
  }

  static String convertFromDecimalToOctal(String number) {
    bool isDouble = int.tryParse(number) == null;
    String convertResult = '';
    Queue<int> result = Queue();
    Queue<int> resultDecimal = Queue();

    if (isDouble) {
      String doub = number.split('.')[1];
      int integer = int.parse(number.split('.')[0]);
      double tempDouble = double.parse(doub) / pow(10, doub.length);
      while (tempDouble != 0) {
        if ((tempDouble * 8) >= 1) {
          resultDecimal.addLast(int.parse(tempDouble.toString().split('.')[0]));
          tempDouble =
              (tempDouble * 8) - int.parse(tempDouble.toString().split('.')[0]);
        } else {
          resultDecimal.addLast(0);
          tempDouble = (tempDouble * 8);
        }
      }
      int temp = integer;
      double temp2;
      while (temp != 0) {
        result.addFirst(temp % 8);
        temp2 = temp / 8;
        temp = temp2.toInt();
      }
    } else {
      int temp = int.parse(number);
      double temp2;
      while (temp != 0) {
        result.addFirst(temp % 8);
        temp2 = temp / 8;
        temp = temp2.toInt();
      }
    }
    while (result.isNotEmpty) {
      convertResult += result.removeFirst().toString();
    }
    if (isDouble) {
      convertResult += '.';
      while (resultDecimal.isNotEmpty) {
        convertResult += resultDecimal.removeFirst().toString();
      }
    }
    return convertResult;
  }

  static String convertFromDecimalToHexadecimal(String number) {
    bool isDouble = int.tryParse(number) == null;
    String convertResult = '';
    Queue<int> result = Queue();
    Queue<int> resultDecimal = Queue();

    if (isDouble) {
      String doub = number.split('.')[1];
      int integer = int.parse(number.split('.')[0]);
      double tempDouble = double.parse(doub) / pow(10, doub.length);
      while (tempDouble != 0) {
        if ((tempDouble * 16) >= 1) {
          resultDecimal.addLast(int.parse(tempDouble.toString().split('.')[0]));
          tempDouble = (tempDouble * 16) -
              int.parse(tempDouble.toString().split('.')[0]);
        } else {
          resultDecimal.addLast(0);
          tempDouble = (tempDouble * 16);
        }
      }
      int temp = integer;
      double temp2;
      while (temp != 0) {
        result.addFirst(temp % 16);
        temp2 = temp / 16;
        temp = temp2.toInt();
      }
    } else {
      int temp = int.parse(number);
      double temp2;
      while (temp != 0) {
        result.addFirst(temp % 16);
        temp2 = temp / 16;
        temp = temp2.toInt();
      }
    }
    while (result.isNotEmpty) {
      convertResult += Constants.toHexadecimal[result.removeFirst()]!;
    }
    if (isDouble) {
      convertResult += '.';
      while (resultDecimal.isNotEmpty) {
        convertResult += Constants.toHexadecimal[resultDecimal.removeFirst()]!;
      }
    }
    return convertResult;
  }
}