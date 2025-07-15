import 'dart:math';
import 'package:geolocator/geolocator.dart';
import '../models/weather_model.dart';

class WeatherService {
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5';
  static const String oneCallUrl = 'https://api.openweathermap.org/data/3.0/onecall';

  // You'll need to get your API key from OpenWeatherMap
  // For demo purposes, we'll create mock data
  static const String apiKey = 'YOUR_API_KEY_HERE';

  Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<WeatherModel> getCurrentWeather(double lat, double lon) async {
    // For demo purposes, create mock weather data
    await Future.delayed(const Duration(seconds: 1)); // Simulate API call delay
    return _createMockWeather('Current Location');
  }

  Future<WeatherModel> getWeatherByCity(String cityName) async {
    // For demo purposes, create mock weather data
    await Future.delayed(const Duration(seconds: 1)); // Simulate API call delay

    if (cityName.toLowerCase().contains('error') || cityName.toLowerCase().contains('fail')) {
      throw Exception('City not found');
    }

    return _createMockWeather(cityName);
  }

  WeatherModel _createMockWeather(String cityName) {
    final random = Random();

    // Weather conditions for mock data
    final weatherConditions = [
      {'icon': '01d', 'description': 'clear sky'},
      {'icon': '02d', 'description': 'few clouds'},
      {'icon': '03d', 'description': 'scattered clouds'},
      {'icon': '04d', 'description': 'broken clouds'},
      {'icon': '09d', 'description': 'shower rain'},
      {'icon': '10d', 'description': 'rain'},
      {'icon': '11d', 'description': 'thunderstorm'},
      {'icon': '13d', 'description': 'snow'},
      {'icon': '50d', 'description': 'mist'},
    ];

    final condition = weatherConditions[random.nextInt(weatherConditions.length)];
    final baseTemp = 15 + random.nextInt(20); // Temperature between 15-35°C

    // Create mock hourly forecast (next 24 hours)
    final hourlyForecast = <HourlyForecast>[];
    for (int i = 1; i <= 24; i++) {
      hourlyForecast.add(
        HourlyForecast(
          time: DateTime.now().add(Duration(hours: i)),
          temperature: (baseTemp + random.nextInt(10) - 5).toDouble(),
          icon: weatherConditions[random.nextInt(weatherConditions.length)]['icon']!,
          description: weatherConditions[random.nextInt(weatherConditions.length)]['description']!,
          humidity: 40 + random.nextInt(40), // 40-80%
          windSpeed: random.nextDouble() * 15, // 0-15 m/s
        ),
      );
    }

    // Create mock daily forecast (next 7 days)
    final dailyForecast = <DailyForecast>[];
    for (int i = 1; i <= 7; i++) {
      final maxTemp = baseTemp + random.nextInt(8);
      final minTemp = maxTemp - 5 - random.nextInt(8);

      dailyForecast.add(
        DailyForecast(
          date: DateTime.now().add(Duration(days: i)),
          maxTemp: maxTemp.toDouble(),
          minTemp: minTemp.toDouble(),
          icon: weatherConditions[random.nextInt(weatherConditions.length)]['icon']!,
          description: weatherConditions[random.nextInt(weatherConditions.length)]['description']!,
          humidity: 40 + random.nextInt(40),
          windSpeed: random.nextDouble() * 15,
          chanceOfRain: random.nextInt(100).toDouble(),
        ),
      );
    }

    return WeatherModel(
      cityName: cityName,
      temperature: baseTemp.toDouble(),
      description: condition['description']!,
      icon: condition['icon']!,
      feelsLike: (baseTemp + random.nextInt(6) - 3).toDouble(),
      humidity: 40 + random.nextInt(40),
      windSpeed: random.nextDouble() * 15,
      pressure: 1000 + random.nextInt(50), // 1000-1050 hPa
      visibility: 5 + random.nextDouble() * 15, // 5-20 km
      uvIndex: random.nextInt(11), // 0-10
      dateTime: DateTime.now(),
      hourlyForecast: hourlyForecast,
      dailyForecast: dailyForecast,
    );
  }
}
