import 'package:flutter/material.dart';
import 'package:weather_app/features/current_weather/presentation/widgets/input_action_card.dart';
import 'package:weather_app/features/current_weather/presentation/widgets/logo_widget.dart';
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: appSize(context: context, unit: 1) / 3),
              const LogoWidget(),
              SizedBox(height: appSize(context: context, unit: 1) / 2),
              const InputActionCardWidget(),
              SizedBox(height: appSize(context: context, unit: 1) / 3),
            ],
          ),
        ),
      ),
    );
  }
}
