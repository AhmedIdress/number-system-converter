import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final List<String> convertTypes = [
    'Decimal',
    'Binary',
    'Octal',
    'Hexadecimal',
  ];
  Map<int, String> toHexa = {
    0: '0',
    1: '1',
    2: '2',
    3: '3',
    4: '4',
    5: '5',
    6: '6',
    7: '7',
    8: '8',
    9: '9',
    10: 'A',
    11: 'B',
    12: 'C',
    13: 'D',
    14: 'E',
    15: 'F',
  };
  Map<String, int> fromHexa = {
    '0': 0,
    '1': 1,
    '2': 2,
    '3': 3,
    '4': 4,
    '5': 5,
    '6': 6,
    '7': 7,
    '8': 8,
    '9': 9,
    'A': 10,
    'B': 11,
    'C': 12,
    'D': 13,
    'E': 14,
    'F': 15,
  };
  List<DropdownMenuItem<String>> convertTypesMenuItem = [];
  late String dropDownValue1;
  late String dropDownValue2;
  var keyType = TextInputType.number;
  String convertResult = '';
  @override
  void onInit() {
    dropDownValue1 = convertTypes[0];
    dropDownValue2 = convertTypes[1];
    convertTypesMenuItem = convertTypes.map((element) {
      return DropdownMenuItem(
        child: Text(element),
        value: element,
      );
    }).toList();
    super.onInit();
  }

  void changeDropDownButton1(String value) {
    dropDownValue1 = value;
    if (dropDownValue1 == 'Hexadecimal') {
      keyType = TextInputType.text;
    }else{
      keyType = TextInputType.number;
    }
    update();
  }

  void changeDropDownButton2(String value) {
    dropDownValue2 = value;
    update();
  }

  void convert(String convertNumber) {
    switch (dropDownValue1 + dropDownValue2) {
      case 'Decimal' 'Binary':
        convertFromDecimalToBinary(convertNumber);
        break;
      case 'Binary' 'Decimal':
        convertFromBinaryToDecimal(convertNumber);
        break;
      case 'Decimal' 'Octal':
        convertFromDecimalToOctal(convertNumber);
        break;
      case 'Decimal' 'Hexadecimal':
        convertFromDecimalToHexadecimal(convertNumber);
        break;
      case 'Binary' 'Octal':
        convertFromBinaryToOctal(convertNumber);
        break;
      case 'Binary' 'Hexadecimal':
        convertFromBinaryToHexadecimal(convertNumber);
        break;
      case 'Octal' 'Decimal':
        convertFromOctalToDecimal(convertNumber);
        break;
      case 'Octal' 'Binary':
        convertFromOctalToBinary(convertNumber);
        break;
      case 'Octal' 'Hexadecimal':
        convertFromOctalToHexadecimal(convertNumber);
        break;
      case 'Hexadecimal' 'Binary':
        convertFromHexadecimalToBinary(convertNumber);
        break;
      case 'Hexadecimal' 'Decimal':
        convertFromHexadecimalToDecimal(convertNumber);
        break;
      case 'Hexadecimal' 'Octal':
        convertFromHexadecimalToOctal(convertNumber);
        break;
    }
    update();
  }

  void convertFromDecimalToBinary(String number) {
    bool isDouble = int.tryParse(number) == null;
    convertResult = '';
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
    } else {
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
  }

  void convertFromDecimalToOctal(String number) {
    bool isDouble = int.tryParse(number) == null;
    convertResult = '';
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
  }

  void convertFromDecimalToHexadecimal(String number) {
    bool isDouble = int.tryParse(number) == null;
    convertResult = '';
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
      convertResult += toHexa[result.removeFirst()]!;
    }
    if (isDouble) {
      convertResult += '.';
      while (resultDecimal.isNotEmpty) {
        convertResult += toHexa[resultDecimal.removeFirst()]!;
      }
    }
  }

  void convertFromBinaryToDecimal(String number) {
    bool isDouble = int.tryParse(number) == null;
    convertResult = '';
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
        result += digit * pow(2, i++).toInt();
      }
      for (int j = -(number.split('.')[1].length); j < 0; j++) {
        digit = decimal % 10;
        decimal = decimal ~/ 10;
        resultD += digit.toDouble() * pow(2, j).toDouble();
      }
    } else {
      int binary = int.parse(number);
      for (int i = 0; i < number.length; i++) {
        digit = binary % 10;
        binary = binary ~/ 10;
        result += digit * pow(2, i).toInt();
      }
    }
    if (isDouble) {
      convertResult = (resultD + result.toDouble()).toString();
    } else {
      convertResult = result.toString();
    }
  }

  void convertFromOctalToDecimal(String number) {
    bool isDouble = int.tryParse(number) == null;
    convertResult = '';
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
  }

  void convertFromHexadecimalToDecimal(String number) {
    bool isDouble = false;
    convertResult = '';
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
        digit = fromHexa[integer[i]]!;
        result += digit * pow(16, -(i+1)).toInt();
      }
      for (int i = 0; i < decimal.length; i++) {
        digit = fromHexa[decimal[i]]!;
        resultD += digit * pow(16, -(i + 1));
      }
    } else {
      for (int i = 0; i < number.length; i++) {
        digit = fromHexa[number[i]]!;
        result += digit * pow(16, number.length-i-1).toInt();
      }
    }
    if (isDouble) {
      convertResult = (resultD + result.toDouble()).toString();
    } else {
      convertResult = result.toString();
    }
  }

  void convertFromOctalToBinary(String number) {
    bool isDouble = false;
    convertResult = '';
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
  }

  void convertFromHexadecimalToBinary(String number) {
    bool isDouble = false;
    convertResult = '';
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
  }

  void convertFromBinaryToOctal(String number) {
    bool isDouble = false;
    convertResult = '';
    for (int i = 0; i < number.length; i++) {
      if (number[i] == '.') {
        isDouble = true;
        break;
      }
    }
    if (isDouble) {
      String integer = number.split('.')[0];
      String decimal = number.split('.')[1];
      String sub='';
      int digit = 0;
      int i=0;
      if(integer.length%3==0)
      {
        i=0;
      }
      else if(integer.length%3==2)
      {

        i=2;
        sub = integer.substring(0,2);
        if(sub[0]!=0.toString()&&sub[1]!=0.toString()){
        sub = integer.substring(0,2);
        for (int j = 0; j < sub.length; j++){
          digit+=int.parse(sub[j])*pow(2, 2-j).toInt();
        }
        convertResult+=digit.toString();
        digit=0;}

      }
      else if(integer.length%3==1)
      {
        if(integer[0]=='1'){
          convertResult+=1.toString();
        }
        i=1;
      }
      for (i ; i < integer.length; i+=3)
      {
        sub = integer.substring(i,i+3);
        for (int j = 0; j < sub.length; j++){
          digit+=int.parse(sub[j])*pow(2, 2-j).toInt();
        }
        convertResult+=digit.toString();
        digit=0;
      }
      convertResult+='.';
      if(decimal.length%3==0)
      {
        i=0;
      }
      else if(decimal.length%3==2)
      {
        i=2;
        sub = decimal.substring(0,2);
        if(sub[0]!=0.toString()&&sub[1]!=0.toString()){
        sub = number.substring(0,2);
        for (int j = 0; j < sub.length; j++){
          digit+=int.parse(sub[j])*pow(2, 2-j).toInt();
        }
        convertResult+=digit.toString();
        digit=0;}
      }
      else if(decimal.length%3==1)
      {
        if(decimal[0]=='1')
          {
            convertResult+=1.toString();
          }
        i=1;
      }
      for (i ; i < decimal.length; i+=3)
      {
        sub = decimal.substring(i,i+3);
        for (int j = 0; j < sub.length; j++){
          digit+=int.parse(sub[j])*pow(2, 2-j).toInt();
        }
        convertResult+=digit.toString();
        digit=0;
      }
    }
    else {
      int i=0;
      String sub='';
      int digit = 0;
      if(number.length%3==0)
      {
       i=0;
      }
      else if(number.length%3==2)
      {
        i=2;
            sub = number.substring(0,2);
            if(sub[0]!=0.toString()&&sub[1]!=0.toString())
              {
            for (int j = 0; j < sub.length; j++){
              digit+=int.parse(sub[j])*pow(2, 2-j).toInt();
            }
            convertResult+=digit.toString();
            digit=0;}
      }
      else if(number.length%3==1)
      {
        i=1;
        if(number[0]=='1')
          {
            convertResult+=1.toString();
          }
      }
      for (i ; i < number.length; i+=3)
      {
        sub = number.substring(i,i+3);
        for (int j = 0; j < sub.length; j++){
          digit+=int.parse(sub[j])*pow(2, (2-j)).toInt();
        }
        convertResult+=digit.toString();
        digit=0;
      }
    }
  }

  void convertFromBinaryToHexadecimal(String number) {
    bool isDouble = false;
    convertResult = '';
    for (int i = 0; i < number.length; i++) {
      if (number[i] == '.') {
        isDouble = true;
        break;
      }
    }
    if (isDouble) {
      String integer = number.split('.')[0];
      String decimal = number.split('.')[1];
      String sub='';
      int i =0;
      int digit = 0;
      if(integer.length%4==0)
      {
        i=0;
      }
      else if(number.length%4==3)
      {
        i=3;
        sub = integer.substring(0,3);
        for (int j = 0; j < sub.length; j++){
          digit+=int.parse(sub[j])*pow(2, 2-j).toInt();
        }
        convertResult+=toHexa[digit].toString();
        digit=0;
      }
      else if(integer.length%4==2)
      {
        i=2;
        sub = integer.substring(0,2);
        for (int j = 0; j < sub.length; j++){
          digit+=int.parse(sub[j])*pow(2, 1-j).toInt();
        }
        convertResult+=toHexa[digit].toString();
        digit=0;
      }
      else if(integer.length%4==1)
      {
        i=1;
        convertResult+=1.toString();
      }
      for (i ; i < integer.length; i+=4)
      {
        sub = integer.substring(i,i+4);
        for (int j = 0; j < sub.length; j++){
          digit+=int.parse(sub[j])*pow(2, 3-j).toInt();
        }
        convertResult+=toHexa[digit].toString();
        digit=0;
      }
      convertResult+='.';
      if(decimal.length%4==0)
      {
        i=0;
      }
      else if(decimal.length%4==3)
      {
        i=3;
        sub = decimal.substring(0,3);
        for (int j = 0; j < sub.length; j++){
          digit+=int.parse(sub[j])*pow(2, 2-j).toInt();
        }
        convertResult+=toHexa[digit].toString();
        digit=0;
      }
      else if(decimal.length%4==2)
      {
        i=2;
        sub = decimal.substring(0,2);
        for (int j = 0; j < sub.length; j++){
          digit+=int.parse(sub[j])*pow(2, 1-j).toInt();
        }
        convertResult+=toHexa[digit].toString();
        digit=0;
      }
      else if(decimal.length%4==1)
      {
        i=1;
        convertResult+=1.toString();
      }
      for (i ; i < decimal.length; i+=4)
      {
        sub = decimal.substring(i,i+4);
        for (int j = 0; j < sub.length; j++){
          digit+=int.parse(sub[j])*pow(2, 3-j).toInt();
        }
        convertResult+=toHexa[digit].toString();
        digit=0;
      }
    }
    else {
      int i =0;
      String sub='';
      int digit = 0;
      if(number.length%4==0)
      {
        i=0;
      }
      else if(number.length%4==3)
      {
        i=3;
        sub = number.substring(0,3);
        for (int j = 0; j < 3; j++){
          digit+=int.parse(sub[j])*pow(2, 2-j).toInt();
        }
        convertResult+=toHexa[digit].toString();
        digit=0;
      }
      else if(number.length%4==2)
      {
        i=2;
        sub = number.substring(0,2);
        for (int j = 0; j < sub.length; j++){
          digit+=int.parse(sub[j])*pow(2, 1-j).toInt();
        }
        convertResult+=toHexa[digit].toString();
        digit=0;
      }
      else if(number.length%4==1)
      {
        i=1;
        convertResult+=1.toString();
      }
      for (i ; i < number.length; i+=4)
      {
        sub = number.substring(i,i+4);
        for (int j = 0; j < sub.length; j++){
          digit+=int.parse(sub[j])*pow(2, 3-j).toInt();
        }
        convertResult+=toHexa[digit].toString();
        digit=0;
      }
    }
  }

  void convertFromOctalToHexadecimal(String number){
    convertFromOctalToBinary(number);
    convertFromBinaryToHexadecimal(convertResult);
  }

  void convertFromHexadecimalToOctal(String number){
    convertFromHexadecimalToBinary(number);
    convertFromBinaryToOctal(convertResult);
  }
}
