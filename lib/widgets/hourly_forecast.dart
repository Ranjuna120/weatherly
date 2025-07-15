import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/weather_model.dart';
import '../providers/weather_provider.dart';

class HourlyForecastWidget extends StatelessWidget {
  final List<HourlyForecast> hourlyData;

  const HourlyForecastWidget({super.key, required this.hourlyData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Hourly Forecast',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: hourlyData.length > 12 ? 12 : hourlyData.length,
            itemBuilder: (context, index) {
              final forecast = hourlyData[index];
              final weatherProvider = context.read<WeatherProvider>();
              final icon = weatherProvider.getWeatherIcon(forecast.icon);

              return Container(
                width: 80,
                margin: const EdgeInsets.only(right: 12),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white.withOpacity(0.3), width: 1),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(_formatHour(forecast.time), style: const TextStyle(fontSize: 12, color: Colors.white70)),
                    Text(icon, style: const TextStyle(fontSize: 24)),
                    Text(
                      '${forecast.temperature.round()}°',
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  String _formatHour(DateTime dateTime) {
    if (dateTime.hour == 0) {
      return '12 AM';
    } else if (dateTime.hour == 12) {
      return '12 PM';
    } else if (dateTime.hour < 12) {
      return '${dateTime.hour} AM';
    } else {
      return '${dateTime.hour - 12} PM';
    }
  }
}
