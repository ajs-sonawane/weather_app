import 'package:weather_app/features/current_weather/data/model/resp/current_weather_resp.dart';

enum CurrentWeatherStatus { initial, loading, success, failure }

class CurrentWeatherState {
  const CurrentWeatherState(
      {this.status = CurrentWeatherStatus.initial,
      this.resp,
      this.message = ""});

  final CurrentWeatherStatus status;
  final String message;
  final CurrentWeatherResp? resp;

  CurrentWeatherState copyWith(
      {CurrentWeatherStatus? status,
      CurrentWeatherResp? resp,
      String? message}) {
    return CurrentWeatherState(
      status: status ?? this.status,
      message: message ?? this.message,
      resp: resp ?? this.resp,
    );
  }
}
