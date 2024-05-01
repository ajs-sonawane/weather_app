
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/shared/data/base_api.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CurrentWeatherRemoteDataSource {
  final BaseApi _baseApi = BaseApi();




  Future<Response> fetchCurrentWeather(String location) async {
    await dotenv.load();

    String apikey = dotenv.get('WeatherApiKey');

    return await _baseApi.get(
      "/current.json?key=$apikey&q=$location&aqi=no",
    );
  }
}
