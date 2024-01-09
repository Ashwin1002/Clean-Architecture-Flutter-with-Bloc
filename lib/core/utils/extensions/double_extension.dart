import 'package:flutter/cupertino.dart';

extension DoubleExtension on double {
  SizedBox get horizontalSpace => SizedBox(width: this);
  SizedBox get verticalSpace => SizedBox(height: this);
}
