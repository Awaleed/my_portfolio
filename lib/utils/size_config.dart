import 'package:flutter/material.dart';

class SizeConfig {
  SizeConfig._();

  static late double _blockSizeHorizontal;
  static late double _blockSizeVertical;
  static ValueNotifier listable = ValueNotifier(0);

  static void init(double _screenWidth, double _screenHeight) {
    _blockSizeHorizontal = _screenWidth / 100;
    _blockSizeVertical = _screenHeight / 100;
    listable.value++;
  }

  static double height(double height) => height * _blockSizeVertical;
  static double width(double width) => width * _blockSizeHorizontal;
}
