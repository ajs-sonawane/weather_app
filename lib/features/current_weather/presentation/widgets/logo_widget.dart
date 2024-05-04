import 'package:flutter/material.dart';
import 'package:weather_app/utils/const.dart';
import 'package:weather_app/utils/size.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: appSize(context: context, unit: 14),
      width: appSize(context: context, unit: 14),
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: AssetImage(kAllWeatherBG), fit: BoxFit.fill)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Weather Fetch",
            style: TextStyle(
                color: Colors.brown,
                height: 1,
                fontSize: appSize(context: context, unit: 1) / 4,
                fontWeight: FontWeight.bold),
          ),
          Text("Stay updated with current weather conditions.",
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: appSize(context: context, unit: 1) / 12)),
        ],
      ),
    );
  }
}
