import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/features/current_weather/presentation/screens/weather_details_screen.dart';
import 'package:weather_app/utils/app_bottomsheets.dart';
import 'package:weather_app/utils/helpers.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 33),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Column(
                children: [
                  Text(
                    "Weather Fetch",
                    style: TextStyle(
                        height: 1, fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  Text("Stay updated with current weather conditions."),
                ],
              ),
              Column(
                children: [
                  const Text(
                    "Enter the name of a place to get current weather conditions.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black45, fontSize: 18),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(22)),
                    child: TextFormField(
                      textCapitalization: TextCapitalization.words,
                      showCursor: true,
                      onEditingComplete: () {},
                      controller: searchController,
                      cursorColor: Colors.black,
                      decoration: const InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 22, vertical: 9),
                          counterText: "",
                          isDense: true,
                          errorStyle: TextStyle(
                              height: 0.3,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                          border: InputBorder.none,
                          hintText: "Enter place name"),
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          letterSpacing: 0.3),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            style: ButtonStyle(
                                padding: MaterialStateProperty.resolveWith(
                                    (states) => const EdgeInsets.symmetric(
                                        horizontal: 22, vertical: 9)),
                                backgroundColor:
                                    MaterialStateProperty.resolveWith(
                                        (states) => Color(Colors.black.value))),
                            onPressed: () {
                              if (searchController.text.isNotEmpty) {
                                Navigator.of(context).push(goToRoute(
                                    WeatherDetailsScreen(
                                        location: searchController.text)));
                              } else {
                                AppBottomSheets.showSnackBar(
                                    context, "Please enter city name.");
                              }
                            },
                            child: const Text(
                              "Get Weather Conditions",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
