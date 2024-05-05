import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/current_weather/presentation/bloc/cw_blocs.dart';
import 'package:weather_app/features/current_weather/presentation/bloc/cw_events.dart';
import 'package:weather_app/features/current_weather/presentation/bloc/cw_states.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:weather_app/shared/res/styles.dart';
import 'package:weather_app/shared/widgets/app_alert_widget.dart';
import 'package:weather_app/shared/widgets/app_button.dart';
import 'package:weather_app/utils/const.dart';
import 'package:weather_app/utils/size.dart';

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
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      // DeviceOrientation.landscapeLeft,
      // DeviceOrientation.landscapeRight,
    ]);
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
              return Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                          child: Image.asset(
                              _getBGImage(
                                  "${state.resp?.current?.condition?.text}"),
                              fit: BoxFit.fill)),
                    ],
                  ),
                  Positioned(
                    top: 20,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Icon(Icons.close_rounded,
                              color: Colors.white,
                              size:
                                  appSize(context: context, unit: 3) / 3 - 10),
                        ),
                        const SizedBox(width: 12)
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 22),
                            // color: Colors.blue,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${state.resp?.current?.tempC?.toInt()}",
                                    style: TextStyle(
                                        height: 1,
                                        fontSize:
                                            appSize(context: context, unit: 3),
                                        // fontWeight: FontWeight.,
                                        color: Colors.white)),
                                Text("\u2103",
                                    style: TextStyle(
                                        height: 1,
                                        fontSize:
                                            appSize(context: context, unit: 2) /
                                                2,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 22),
                            // color: Colors.redAccent,
                            child: Text(
                              "${state.resp?.location?.name}".toUpperCase(),
                              style: TextStyle(
                                  fontSize:
                                      appSize(context: context, unit: 3) / 4,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            width: appSize(context: context, unit: 18),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 22, vertical: 22),
                            decoration: BoxDecoration(
                                color: Colors.black26,
                                borderRadius: BorderRadius.circular(22),
                                border:
                                    Border.all(color: Colors.white, width: 2)),
                            child: Row(
                              children: [
                                Expanded(
                                  child: _weatherMeasureContainer(
                                      "Weather Condition",
                                      "${state.resp?.current?.condition?.text}"),
                                ),
                                CircleAvatar(
                                  radius:
                                      appSize(context: context, unit: 2) / 2.5,
                                  backgroundColor: Colors.black26,
                                  child: Image.asset(
                                    "$kAssetsDirectory$icon",
                                    color: Colors.white,
                                    fit: BoxFit.fill,
                                    // height: appSize(context: context, unit: 2),
                                    // width: appSize(context: context, unit: 12)/3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),

                          ///
                          Container(
                              width: appSize(context: context, unit: 18),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 22, vertical: 22),
                              decoration: BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius: BorderRadius.circular(22),
                                  border: Border.all(
                                      color: Colors.white, width: 2)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Text("Temperature for the day -",
                                          style: AppStyles.weatherValueStyle(
                                              context)),
                                      Row(
                                        children: [
                                          _weatherMeasureContainer(
                                              "MIN", "26.8"),
                                          _verticalDivider(),
                                          _weatherMeasureContainer(
                                              "MAX", "35.7")
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              )),
                          const SizedBox(height: 12),
                          Container(
                              width: appSize(context: context, unit: 18),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 22, vertical: 22),
                              decoration: BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius: BorderRadius.circular(22),
                                  border: Border.all(
                                      color: Colors.white, width: 2)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  _weatherMeasureContainer("Humidity",
                                      "${state.resp?.current?.humidity}%"),
                                  _verticalDivider(),
                                  _weatherMeasureContainer("Wind",
                                      "${state.resp?.current?.windKph}kph"),
                                ],
                              )),
                        ],
                      )
                    ],
                  ),
                ],
              );
            }
            if (state.status == CurrentWeatherStatus.failure) {
              return AppAlertWidget(
                  title: "Something went wrong",
                  subTitle:
                      "Please check your internet connection or try restarting the application",
                  icon: Icons.error,
                  isRefresh: true,
                  onRefresh: () {
                    BlocProvider.of<CurrentWeatherBloc>(context)
                        .add(FetchCurrentWeatherCondition(widget.location));
                  });
            }
            return const Center(
              child: CircularProgressIndicator(color: Colors.black),
            );
          },
        ),
      ),
    );
  }

  Widget _weatherMeasureContainer(title, value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        children: [
          Text(value,
              textAlign: TextAlign.center,
              style: AppStyles.weatherValueStyle(context)),
          Text(title,
              textAlign: TextAlign.center,
              style: AppStyles.weatherTitleStyle(context)),
        ],
      ),
    );
  }

  _verticalDivider() {
    return Container(
      height: 40,
      width: 1,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(50)),
    );
  }

  String _getBGImage(String value) {
    switch (value.toLowerCase()) {
      case "mist":
        return kMistImg;
      case "rain":
        return kRainImg;
      case "snow":
        return kSnowImg;
      case "cloudy":
        return kCloudyImg;
      default:
        if (value.toLowerCase().contains("rain")) {
          return kRainImg;
        }
        if (value.toLowerCase().contains("sun")) {
          return kSunnyImg;
        }
        if (value.toLowerCase().contains("snow")) {
          return kSnowImg;
        }

        return kClearImg;
    }
  }
}
