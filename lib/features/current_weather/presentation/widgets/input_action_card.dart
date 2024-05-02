import 'package:flutter/material.dart';
import 'package:weather_app/features/current_weather/presentation/screens/weather_details_screen.dart';
import 'package:weather_app/utils/app_bottomsheets.dart';
import 'package:weather_app/utils/helpers.dart';
import 'package:weather_app/utils/size.dart';

class InputActionCardWidget extends StatefulWidget {
  const InputActionCardWidget({super.key});

  @override
  State<InputActionCardWidget> createState() => _InputActionCardWidgetState();
}

class _InputActionCardWidgetState extends State<InputActionCardWidget> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 33),
      margin: const EdgeInsets.symmetric(horizontal: 22),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
                color: Colors.grey,
                offset: Offset(4, 4),
                spreadRadius: 1,
                blurRadius: 9)
          ]),
      child: Column(
        children: [
          Text(
            "Enter the name of a place to get current weather conditions.",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black54,
                fontSize: appSize(context: context, unit: 1) / 6),
          ),
          SizedBox(height: appSize(context: context, unit: 1) / 3),
          Container(
            decoration: BoxDecoration(
                color: Colors.black12, borderRadius: BorderRadius.circular(22)),
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
          SizedBox(height: appSize(context: context, unit: 1) / 13),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.resolveWith((states) =>
                            const EdgeInsets.symmetric(
                                horizontal: 22, vertical: 14)),
                        backgroundColor: MaterialStateProperty.resolveWith(
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
              SizedBox(height: appSize(context: context, unit: 1) / 3),
            ],
          )
        ],
      ),
    );
  }
}
