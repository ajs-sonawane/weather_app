import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/current_weather/presentation/screens/location_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown,
    // ]);
    return MultiBlocProvider(
        providers: const [
          // BlocProvider(create: (context) => LoginBloc(authRepository)),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Weather Fetch',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.grey,
                accentColor: Colors.grey,
              ),
              scaffoldBackgroundColor: Colors.white,
            ),
            home: const LocationScreen()));
            // home: const Splash()));
  }
}