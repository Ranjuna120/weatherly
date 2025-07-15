import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/weather_model.dart';
import '../providers/weather_provider.dart';

class DailyForecastWidget extends StatelessWidget {
  final List<DailyForecast> dailyData;

  const DailyForecastWidget({super.key, required this.dailyData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.3), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '7-Day Forecast',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          const SizedBox(height: 16),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: dailyData.length,
            itemBuilder: (context, index) {
              final forecast = dailyData[index];
              final weatherProvider = context.read<WeatherProvider>();
              final icon = weatherProvider.getWeatherIcon(forecast.icon);

              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [
                    // Day
                    Expanded(
                      flex: 2,
                      child: Text(_formatDay(forecast.date), style: const TextStyle(fontSize: 14, color: Colors.white)),
                    ),

                    // Weather Icon
                    Text(icon, style: const TextStyle(fontSize: 24)),

                    const SizedBox(width: 16),

                    // Chance of Rain
                    SizedBox(
                      width: 40,
                      child: Text(
                        '${forecast.chanceOfRain.round()}%',
                        style: const TextStyle(fontSize: 12, color: Colors.white70),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    const SizedBox(width: 16),

                    // Temperature Range
                    Text(
                      '${forecast.minTemp.round()}° / ${forecast.maxTemp.round()}°',
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  String _formatDay(DateTime dateTime) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final targetDay = DateTime(dateTime.year, dateTime.month, dateTime.day);

    final difference = targetDay.difference(today).inDays;

    if (difference == 0) {
      return 'Today';
    } else if (difference == 1) {
      return 'Tomorrow';
    } else {
      final weekdays = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
      return weekdays[dateTime.weekday - 1];
    }
  }
}
