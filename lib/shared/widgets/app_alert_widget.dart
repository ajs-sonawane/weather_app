import 'package:flutter/material.dart';
import 'package:weather_app/shared/res/styles.dart';
import 'package:weather_app/shared/widgets/app_button.dart';
import 'package:weather_app/utils/size.dart';

class AppAlertWidget extends StatelessWidget {
  const AppAlertWidget(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.icon,
      required this.isRefresh,
      this.onRefresh});

  final String title;
  final String subTitle;
  final IconData icon;
  final bool isRefresh;
  final Function()? onRefresh;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: appSize(context: context, unit: 18),
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 22),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(44),
            border: Border.all(color: Colors.red)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon,
                size: appSize(context: context, unit: 3) / 3,
                color: Colors.redAccent),
            const SizedBox(height: 8),
            Text(title,
                textAlign: TextAlign.center,
                style: AppStyles.errorTitleStyle(context)),
            const SizedBox(height: 4),
            Text(subTitle,
                textAlign: TextAlign.center,
                style: AppStyles.errorSubTitleStyle(context)),
            const SizedBox(height: 20),
            if (isRefresh)
              AppButton(
                  title: "Refresh", onPressed: onRefresh, color: Colors.brown),
            const SizedBox(height: 8),
            AppButton(
                title: "Back",
                onPressed: () => Navigator.of(context).maybePop(),
                color: Colors.black),
          ],
        ),
      ),
    );
  }
}
