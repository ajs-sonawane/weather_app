import 'package:flutter/material.dart';

@immutable
sealed class CurrentWeatherEvent {}

class FetchCurrentWeatherCondition extends CurrentWeatherEvent {
  FetchCurrentWeatherCondition(this.location);

  final String location;
}
