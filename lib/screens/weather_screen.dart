import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../providers/weather_provider.dart';
import '../widgets/weather_card.dart';
import '../widgets/hourly_forecast.dart';
import '../widgets/daily_forecast.dart';
import '../widgets/weather_details.dart';
import 'search_screen.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<WeatherProvider>().getCurrentLocationWeather();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<WeatherProvider>(
        builder: (context, weatherProvider, child) {
          final weather = weatherProvider.currentWeather;
          final isLoading = weatherProvider.isLoading;
          final error = weatherProvider.error;

          if (isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (error != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, size: 64, color: Colors.red[300]),
                  const SizedBox(height: 16),
                  Text('Error: $error', style: const TextStyle(fontSize: 16), textAlign: TextAlign.center),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      weatherProvider.clearError();
                      weatherProvider.getCurrentLocationWeather();
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          if (weather == null) {
            return const Center(child: Text('No weather data available'));
          }

          final backgroundColor = weatherProvider.getBackgroundColor(weather.icon);

          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [backgroundColor, backgroundColor.withOpacity(0.7)],
              ),
            ),
            child: SafeArea(
              child: RefreshIndicator(
                onRefresh: () => weatherProvider.getCurrentLocationWeather(),
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: AnimationLimiter(
                    child: Column(
                      children: AnimationConfiguration.toStaggeredList(
                        duration: const Duration(milliseconds: 375),
                        childAnimationBuilder: (widget) =>
                            SlideAnimation(verticalOffset: 50.0, child: FadeInAnimation(child: widget)),
                        children: [
                          // App Bar
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Weatherly',
                                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.search, color: Colors.white, size: 28),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const SearchScreen()),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),

                          // Main Weather Card
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: WeatherCard(weather: weather),
                          ),

                          const SizedBox(height: 20),

                          // Weather Details
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: WeatherDetails(weather: weather),
                          ),

                          const SizedBox(height: 20),

                          // Hourly Forecast
                          HourlyForecastWidget(hourlyData: weather.hourlyForecast),

                          const SizedBox(height: 20),

                          // Daily Forecast
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: DailyForecastWidget(dailyData: weather.dailyForecast),
                          ),

                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
