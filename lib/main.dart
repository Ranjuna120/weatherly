import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/weather_provider.dart';
import 'screens/weather_screen.dart';

void main() {
  runApp(const WeatherlyApp());
}

class WeatherlyApp extends StatelessWidget {
  const WeatherlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WeatherProvider(),
      child: MaterialApp(
        title: 'Weatherly',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Roboto'),
        home: const WeatherScreen(),
      ),
    );
  }
}
