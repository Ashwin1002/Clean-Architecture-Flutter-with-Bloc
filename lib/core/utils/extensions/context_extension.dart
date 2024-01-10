import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  Size get size => MediaQuery.sizeOf(this);

  double get deviceWidth => MediaQuery.sizeOf(this).width;
  double get deviceHeight => MediaQuery.sizeOf(this).height;

  TextTheme get textTheme => Theme.of(this).textTheme;
}
