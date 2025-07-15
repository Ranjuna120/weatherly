import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/weather_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const WeatherlyApp());
}

class WeatherlyApp extends StatelessWidget {
  const WeatherlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WeatherProvider(),
      child: Consumer<WeatherProvider>(
        builder: (context, weatherProvider, child) {
          return MaterialApp(
            title: 'Weatherly',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              fontFamily: 'Roboto',
              brightness: weatherProvider.isDarkMode ? Brightness.dark : Brightness.light,
              scaffoldBackgroundColor: weatherProvider.isDarkMode ? Colors.grey[900] : Colors.white,
            ),
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
