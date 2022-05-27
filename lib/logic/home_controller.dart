import 'package:flutter/material.dart';
import 'package:number_system/logic/costants.dart';
import 'package:number_system/logic/from_binary.dart';
import 'package:number_system/logic/from_decimal.dart';
import 'package:number_system/logic/from_hexadecimal.dart';
import 'package:number_system/logic/from_octal.dart';

class HomeController {

  static String convert(String convertNumber,String convertFromTo) {
    switch (convertFromTo) {
      case 'Decimal' 'Binary':
        return FromDecimal.convertFromDecimalToBinary(convertNumber);
      case 'Binary' 'Decimal':
        return FromBinary.convertFromBinaryToDecimal(convertNumber);
      case 'Decimal' 'Octal':
        return FromDecimal.convertFromDecimalToOctal(convertNumber);
      case 'Decimal' 'Hexadecimal':
        return FromDecimal.convertFromDecimalToHexadecimal(convertNumber);
      case 'Binary' 'Octal':
        return FromBinary.convertFromBinaryToOctal(convertNumber);
      case 'Binary' 'Hexadecimal':
        return FromBinary.convertFromBinaryToHexadecimal(convertNumber);
      case 'Octal' 'Decimal':
        return FromOctal.convertFromOctalToDecimal(convertNumber);
      case 'Octal' 'Binary':
        return FromOctal.convertFromOctalToBinary(convertNumber);
      case 'Octal' 'Hexadecimal':
        return FromOctal.convertFromOctalToHexadecimal(convertNumber);
      case 'Hexadecimal' 'Binary':
        return FromHexadecimal.convertFromHexadecimalToBinary(
            convertNumber.toUpperCase());
      case 'Hexadecimal' 'Decimal':
        return FromHexadecimal.convertFromHexadecimalToDecimal(
            convertNumber.toUpperCase());
      case 'Hexadecimal' 'Octal':
        return FromHexadecimal.convertFromHexadecimalToOctal(
            convertNumber.toUpperCase());
      default:
        return 'there are error';
    }
  }
}
