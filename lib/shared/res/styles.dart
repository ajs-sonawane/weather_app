import 'package:flutter/material.dart';
import 'package:weather_app/utils/size.dart';

class AppStyles {
  static TextStyle errorTitleStyle(context) => TextStyle(
      color: Colors.black, fontSize: appSize(context: context, unit: 3)/6);

  static TextStyle errorSubTitleStyle(context) => TextStyle(
      color: Colors.black54, fontSize: appSize(context: context, unit: 3)/9.5);


}
