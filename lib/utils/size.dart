import 'package:flutter/material.dart';

double appSize({required BuildContext context, required double unit}) {
  double baseUnit = 100;
  double s =
      MediaQuery.of(context).size.height + MediaQuery.of(context).size.width;
  double val = s / 100 * unit + baseUnit;
  return val;
}
