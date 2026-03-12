import 'package:flutter/material.dart';

class Responsive {
  static const double _designWidth = 390;
  static const double _designHeight = 844;

  static late double _screenWidth;
  static late double _screenHeight;
  static late double _scaleWidth;
  static late double _scaleHeight;

  static void init(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    _screenWidth = size.width;
    _screenHeight = size.height;
    _scaleWidth = _screenWidth / _designWidth;
    _scaleHeight = _screenHeight / _designHeight;
  }

  static double w(double value) => value * _scaleWidth;

  static double h(double value) => value * _scaleHeight;

  static double sp(double value) {
    final scale = _scaleWidth < _scaleHeight ? _scaleWidth : _scaleHeight;
    return value * scale;
  }

  static double get screenWidth => _screenWidth;
  static double get screenHeight => _screenHeight;
}
