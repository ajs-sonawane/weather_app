import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/current_weather/presentation/bloc/cw_blocs.dart';
import 'package:weather_app/features/current_weather/presentation/bloc/cw_events.dart';
import 'package:weather_app/features/current_weather/presentation/bloc/cw_states.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:weather_app/utils/const.dart';

class WeatherDetailsScreen extends StatefulWidget {
  const WeatherDetailsScreen({super.key, required this.location});

  final String location;

  @override
  State<WeatherDetailsScreen> createState() => _WeatherDetailsScreenState();
}

class _WeatherDetailsScreenState extends State<WeatherDetailsScreen> {
  @override
  void initState() {
    BlocProvider.of<CurrentWeatherBloc>(context)
        .add(FetchCurrentWeatherCondition(widget.location));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: BlocConsumer<CurrentWeatherBloc, CurrentWeatherState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state.status == CurrentWeatherStatus.success) {
              var icon =
                  state.resp?.current?.condition?.icon?.split(".com").last;
              print("icon link > $kAssetsDirectory$icon");
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("City Name: ${state.resp?.location?.name}"),
                  Text(
                      "Current temperature in Celsius: ${state.resp?.current?.tempC}"),
                  Text(
                      "Current temperature in Fahrenheit: ${state.resp?.current?.tempF}"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          "Weather condition: ${state.resp?.current?.condition?.text}"),
                      Image.asset("$kAssetsDirectory$icon")
                      // CachedNetworkImage(
                      //   imageUrl:
                      //       "$kAssetsDirectory$icon",
                      //   progressIndicatorBuilder:
                      //       (context, url, downloadProgress) =>
                      //           CircularProgressIndicator(
                      //               value: downloadProgress.progress),
                      //   errorWidget: (context, url, error) =>
                      //       const Icon(Icons.error),
                      // ),
                    ],
                  ),
                  Text(
                      "Min temperature for the day: ${state.resp?.forecast?.forecastday?[0].day?.mintempC}"),
                  Text(
                      "Max temperature for the day: ${state.resp?.forecast?.forecastday?[0].day?.maxtempC}"),
                  Text("Humidity: ${state.resp?.current?.humidity}"),
                  Text("Wind speed: ${state.resp?.current?.windKph}"),
                ],
              );
            }
            if (state.status == CurrentWeatherStatus.failure) {
              return Center(child: Text("Error: ${state.message}"));
            }
            return const Center(
              child: CircularProgressIndicator(color: Colors.black),
            );
          },
        ),
      ),
    );
  }
}
