import 'package:flutter/material.dart';
import 'package:weather_app/utils/size.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key, this.onPressed, required this.title, required this.color});

  final Function()? onPressed;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.resolveWith((states) =>
                      const EdgeInsets.symmetric(horizontal: 22, vertical: 14)),
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => Color(color.value))),
              onPressed: onPressed,
              child: Text(
                title,
                style: TextStyle(color: Colors.white),
              )),
        ),
      ],
    );
  }
}
