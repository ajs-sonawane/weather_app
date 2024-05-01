import 'package:flutter/material.dart';
import 'package:weather_app/features/current_weather/data/model/resp/current_weather_resp.dart';
import 'package:weather_app/features/current_weather/data/remote/current_weather_remote_datasource.dart';

class CurrentWeatherRepository {
  final CurrentWeatherRemoteDataSource apiService =
      CurrentWeatherRemoteDataSource();

  Future<CurrentWeatherResp> currentWeatherRepo(String location) async {
    try {
      final response = await apiService.fetchCurrentWeather(location);
      debugPrint("currentWeatherRepo >> ${response.data}");
      return CurrentWeatherResp.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch weather conditions: ${e}');
    }
  }
}
