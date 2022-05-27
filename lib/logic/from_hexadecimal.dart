import 'dart:math';

import 'package:number_system/logic/costants.dart';
import 'package:number_system/logic/from_binary.dart';

class FromHexadecimal{
  static String convertFromHexadecimalToDecimal(String number) {
    bool isDouble = false;
    String convertResult = '';
    int result = 0;
    double resultD = 0.0;
    int digit = 0;
    for (int i = 0; i < number.length; i++) {
      if (number[i] == '.') {
        isDouble = true;
      }
    }
    if (isDouble) {
      String integer = number.split('.')[0];
      String decimal = number.split('.')[1];
      for (int i = 0; i < integer.length; i++) {
        digit = Constants.fromHexadecimal[integer[i]]!;
        result += digit * pow(16, -(i+1)).toInt();
      }
      for (int i = 0; i < decimal.length; i++) {
        digit = Constants.fromHexadecimal[decimal[i]]!;
        resultD += digit * pow(16, -(i + 1));
      }
    } else {
      for (int i = 0; i < number.length; i++) {
        digit = Constants.fromHexadecimal[number[i]]!;
        result += digit * pow(16, number.length-i-1).toInt();
      }
    }
    if (isDouble) {
      convertResult = (resultD + result.toDouble()).toString();
    } else {
      convertResult = result.toString();
    }
    return convertResult;
  }
  static String convertFromHexadecimalToBinary(String number) {
    bool isDouble = false;
    String convertResult = '';
    String digit;
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
        digit = integerPart[i];
        switch (digit) {
          case '0':
            convertResult += '0000';
            break;
          case '1':
            convertResult += '0001';
            break;
          case '2':
            convertResult += '0010';
            break;
          case '3':
            convertResult += '0011';
            break;
          case '4':
            convertResult += '0100';
            break;
          case '5':
            convertResult += '0101';
            break;
          case '6':
            convertResult += '0110';
            break;
          case '7':
            convertResult += '0111';
            break;
          case '8':
            convertResult += '1000';
            break;
          case '9':
            convertResult += '1001';
            break;
          case 'A':
            convertResult += '1010';
            break;
          case 'B':
            convertResult += '1011';
            break;
          case 'C':
            convertResult += '1100';
            break;
          case 'D':
            convertResult += '1101';
            break;
          case 'E':
            convertResult += '1110';
            break;
          case 'F':
            convertResult += '1111';
            break;
        }
      }
      convertResult += '.';
      for (int i = 0; i < decimalPart.length; i++) {
        digit = decimalPart[i];
        switch (digit) {
          case '0':
            convertResult += '0000';
            break;
          case '1':
            convertResult += '0001';
            break;
          case '2':
            convertResult += '0010';
            break;
          case '3':
            convertResult += '0011';
            break;
          case '4':
            convertResult += '0100';
            break;
          case '5':
            convertResult += '0101';
            break;
          case '6':
            convertResult += '0110';
            break;
          case '7':
            convertResult += '0111';
            break;
          case '8':
            convertResult += '1000';
            break;
          case '9':
            convertResult += '1001';
            break;
          case 'A':
            convertResult += '1010';
            break;
          case 'B':
            convertResult += '1011';
            break;
          case 'C':
            convertResult += '1100';
            break;
          case 'D':
            convertResult += '1101';
            break;
          case 'E':
            convertResult += '1110';
            break;
          case 'F':
            convertResult += '1111';
            break;
        }
      }
    } else {
      for (int i = 0; i < number.length; i++) {
        digit = number[i];
        switch (digit) {
          case '0':
            convertResult += '0000';
            break;
          case '1':
            convertResult += '0001';
            break;
          case '2':
            convertResult += '0010';
            break;
          case '3':
            convertResult += '0011';
            break;
          case '4':
            convertResult += '0100';
            break;
          case '5':
            convertResult += '0101';
            break;
          case '6':
            convertResult += '0110';
            break;
          case '7':
            convertResult += '0111';
            break;
          case '8':
            convertResult += '1000';
            break;
          case '9':
            convertResult += '1001';
            break;
          case 'A':
            convertResult += '1010';
            break;
          case 'B':
            convertResult += '1011';
            break;
          case 'C':
            convertResult += '1100';
            break;
          case 'D':
            convertResult += '1101';
            break;
          case 'E':
            convertResult += '1110';
            break;
          case 'F':
            convertResult += '1111';
            break;
        }
      }
    }
    return convertResult;
  }
  static String convertFromHexadecimalToOctal(String number){
    return FromBinary.convertFromBinaryToOctal(convertFromHexadecimalToBinary(number));
  }
}