import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/weather_model.dart';
import '../providers/weather_provider.dart';

class WeatherCard extends StatelessWidget {
  final WeatherModel weather;

  const WeatherCard({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    final weatherProvider = context.read<WeatherProvider>();
    final weatherIcon = weatherProvider.getWeatherIcon(weather.icon);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.3), width: 1),
      ),
      child: Column(
        children: [
          // City Name
          Text(
            weather.cityName,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white),
          ),

          const SizedBox(height: 8),

          // Date
          Text(_formatDate(weather.dateTime), style: const TextStyle(fontSize: 16, color: Colors.white70)),

          const SizedBox(height: 20),

          // Weather Icon
          Text(weatherIcon, style: const TextStyle(fontSize: 80)),

          const SizedBox(height: 20),

          // Temperature
          Text(
            '${weather.temperature.round()}°C',
            style: const TextStyle(fontSize: 48, fontWeight: FontWeight.w300, color: Colors.white),
          ),

          const SizedBox(height: 8),

          // Description
          Text(
            weather.description.toUpperCase(),
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white70,
              letterSpacing: 1.2,
            ),
          ),

          const SizedBox(height: 16),

          // Feels Like
          Text(
            'Feels like ${weather.feelsLike.round()}°C',
            style: const TextStyle(fontSize: 16, color: Colors.white70),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime dateTime) {
    final months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];

    final weekdays = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];

    final weekday = weekdays[dateTime.weekday - 1];
    final month = months[dateTime.month - 1];
    final day = dateTime.day;

    return '$weekday, $month $day';
  }
}
