import 'package:flutter/material.dart';

abstract class AppColors {
  static const darkGray = Color(0xff3B3B3D);
  static const grayScaffoldBackground = Color(0xffFAFAFA);
  static const gray = Color(0xff6C6C6C);
  static const lightGray = Color(0xffC7C8C9);
  static const textGrayColor = Color(0xFF707070);
  static const textDarkGrayColor = Color(0xFF333333);
  static const red = Color(0xFFA90011);

  static const blue = Color(0xff0072C6);

  static const azulFurnas = Color(0xff0072C6);
  static const verdeFurnas = Color(0xff298E36);
  static const amareloFurnas = Color(0xffd3ce00);
  static const azulFundoChipFuncionario = Color(0xffb3d9f7);
  static const azulLetraChipFuncionario = Color(0xff46a9f2);

  static const furnasGradiente = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        azulFurnas,
        verdeFurnas,
        amareloFurnas,
      ]);
}
