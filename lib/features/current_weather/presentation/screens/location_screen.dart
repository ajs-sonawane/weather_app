import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/features/current_weather/presentation/widgets/input_action_card.dart';
import 'package:weather_app/features/current_weather/presentation/widgets/logo_widget.dart';
import 'package:weather_app/utils/const.dart';
import 'package:weather_app/utils/size.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: OrientationBuilder(builder: (context, orientation) {
          if (orientation == Orientation.landscape) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: appSize(context: context, unit: 2) / 2),
                  Row(
                    children: [
                      SizedBox(width: appSize(context: context, unit: 2) / 3),
                      const LogoWidget(),
                      SizedBox(width: appSize(context: context, unit: 2) / 10),
                      Expanded(child: const InputActionCardWidget()),
                      SizedBox(width: appSize(context: context, unit: 2) / 3),
                    ],
                  ),
                ],
              ),
            );
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: appSize(context: context, unit: 5) / 3),
                const LogoWidget(),
                SizedBox(height: appSize(context: context, unit: 15) / 2),
                const InputActionCardWidget(),
                SizedBox(height: appSize(context: context, unit: 1) / 3),
              ],
            ),
          );
        }),
      ),
    );
  }
}
