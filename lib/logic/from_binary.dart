import 'dart:math';

import 'package:number_system/logic/costants.dart';

class FromBinary{
  static String convertFromBinaryToDecimal(String number) {
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
    return convertResult;
  }
  static String convertFromBinaryToOctal(String number) {
    bool isDouble = false;
    String convertResult = '';
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
    return convertResult;
  }
  static String convertFromBinaryToHexadecimal(String number) {
    bool isDouble = false;
    String convertResult = '';
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
        convertResult+=Constants.toHexadecimal[digit].toString();
        digit=0;
      }
      else if(integer.length%4==2)
      {
        i=2;
        sub = integer.substring(0,2);
        for (int j = 0; j < sub.length; j++){
          digit+=int.parse(sub[j])*pow(2, 1-j).toInt();
        }
        convertResult+=Constants.toHexadecimal[digit].toString();
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
        convertResult+=Constants.toHexadecimal[digit].toString();
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
        convertResult+=Constants.toHexadecimal[digit].toString();
        digit=0;
      }
      else if(decimal.length%4==2)
      {
        i=2;
        sub = decimal.substring(0,2);
        for (int j = 0; j < sub.length; j++){
          digit+=int.parse(sub[j])*pow(2, 1-j).toInt();
        }
        convertResult+=Constants.toHexadecimal[digit].toString();
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
        convertResult+=Constants.toHexadecimal[digit].toString();
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
        convertResult+=Constants.toHexadecimal[digit].toString();
        digit=0;
      }
      else if(number.length%4==2)
      {
        i=2;
        sub = number.substring(0,2);
        for (int j = 0; j < sub.length; j++){
          digit+=int.parse(sub[j])*pow(2, 1-j).toInt();
        }
        convertResult+=Constants.toHexadecimal[digit].toString();
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
        convertResult+=Constants.toHexadecimal[digit].toString();
        digit=0;
      }
    }
    return convertResult;
  }
}