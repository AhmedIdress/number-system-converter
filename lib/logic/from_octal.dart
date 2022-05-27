import 'dart:math';
import 'package:number_system/logic/from_binary.dart';

class FromOctal{
  static String convertFromOctalToDecimal(String number) {
    bool isDouble = int.tryParse(number) == null;
    String convertResult = '';
    int result = 0;
    double resultD = 0.0;
    int digit = 0;
    if (isDouble) {
      int integer = int.parse(number.split('.')[0]);
      int decimal = int.parse(number.split('.')[1]);
      int i = 0;
      while (integer != 0) {
        digit = integer % 10;
        integer = integer ~/ 10;
        result += digit * pow(8, i++).toInt();
      }
      for (int j = -(number.split('.')[1].length); j < 0; j++) {
        digit = decimal % 10;
        decimal = decimal ~/ 10;
        resultD += digit.toDouble() * pow(8, j).toDouble();
      }
    } else {
      int binary = int.parse(number);
      for (int i = 0; i < number.length; i++) {
        digit = binary % 10;
        binary = binary ~/ 10;
        result += digit * pow(8, i).toInt();
      }
    }
    if (isDouble) {
      convertResult = (resultD + result.toDouble()).toString();
    } else {
      convertResult = result.toString();
    }
    return convertResult;
  }
  static String convertFromOctalToHexadecimal(String number){
    return FromBinary.convertFromBinaryToHexadecimal(convertFromOctalToBinary(number));
  }
  static String convertFromOctalToBinary(String number) {
    bool isDouble = false;
    String convertResult = '';
    int digit = 0;
    for (int i = 0; i < number.length; i++) {
      if (number[i] == '.') {
        isDouble = true;
        break;
      }
    }
    if (isDouble) {
      String integerPart = number.split('.')[0];
      String decimalPart = number.split('.')[1];
      for (int i = 0; i < integerPart.length; i++) {
        digit = int.parse(integerPart[i]);
        switch (digit) {
          case 0:
            convertResult += '000';
            break;
          case 1:
            convertResult += '001';
            break;
          case 2:
            convertResult += '010';
            break;
          case 3:
            convertResult += '011';
            break;
          case 4:
            convertResult += '100';
            break;
          case 5:
            convertResult += '101';
            break;
          case 6:
            convertResult += '110';
            break;
          case 7:
            convertResult += '111';
            break;
        }
      }
      convertResult += '.';
      for (int i = 0; i < decimalPart.length; i++) {
        digit = int.parse(decimalPart[i]);
        switch (digit) {
          case 0:
            convertResult += '000';
            break;
          case 1:
            convertResult += '001';
            break;
          case 2:
            convertResult += '010';
            break;
          case 3:
            convertResult += '011';
            break;
          case 4:
            convertResult += '100';
            break;
          case 5:
            convertResult += '101';
            break;
          case 6:
            convertResult += '110';
            break;
          case 7:
            convertResult += '111';
            break;
        }
      }
    } else {
      for (int i = 0; i < number.length; i++) {
        digit = int.parse(number[i]);
        switch (digit) {
          case 0:
            convertResult += '000';
            break;
          case 1:
            convertResult += '001';
            break;
          case 2:
            convertResult += '010';
            break;
          case 3:
            convertResult += '011';
            break;
          case 4:
            convertResult += '100';
            break;
          case 5:
            convertResult += '101';
            break;
          case 6:
            convertResult += '110';
            break;
          case 7:
            convertResult += '111';
            break;
        }
      }
    }
    return convertResult;
  }
}
