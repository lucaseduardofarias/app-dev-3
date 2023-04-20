import 'package:flutter/widgets.dart';

abstract class TelaUtil{
  static double getRelativeWidth(BuildContext context, double percent){
    return MediaQuery
        .of(context)
        .size
        .width * percent;
  }
}