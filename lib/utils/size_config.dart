import 'package:flutter/material.dart';

class SizeConfig {
  SizeConfig._();

  static late MediaQueryData _mediaQueryData;
  static late double _screenWidth;
  static late double _screenHeight;
  static late double _blockSizeHorizontal;
  static late double _blockSizeVertical;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    _screenWidth = _mediaQueryData.size.width;
    _screenHeight = _mediaQueryData.size.height;
    _blockSizeHorizontal = _screenWidth / 100;
    _blockSizeVertical = _screenHeight / 100;
  }

  static double height(double height) => height * _blockSizeVertical;
  static double width(double width) => width * _blockSizeHorizontal;
}
