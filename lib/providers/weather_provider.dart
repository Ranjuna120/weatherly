import 'package:flutter/material.dart';
import '../models/weather_model.dart';
import '../services/weather_service.dart';

class WeatherProvider with ChangeNotifier {
  final WeatherService _weatherService = WeatherService();

  WeatherModel? _currentWeather;
  bool _isLoading = false;
  String? _error;
  final List<String> _searchHistory = [];

  WeatherModel? get currentWeather => _currentWeather;
  bool get isLoading => _isLoading;
  String? get error => _error;
  List<String> get searchHistory => _searchHistory;

  Future<void> getCurrentLocationWeather() async {
    _setLoading(true);
    _error = null;

    try {
      final position = await _weatherService.getCurrentLocation();
      final weather = await _weatherService.getCurrentWeather(position.latitude, position.longitude);
      _currentWeather = weather;
    } catch (e) {
      _error = e.toString();
    } finally {
      _setLoading(false);
    }
  }

  Future<void> getWeatherByCity(String cityName) async {
    if (cityName.trim().isEmpty) return;

    _setLoading(true);
    _error = null;

    try {
      final weather = await _weatherService.getWeatherByCity(cityName);
      _currentWeather = weather;
      _addToSearchHistory(cityName);
    } catch (e) {
      _error = 'City not found or network error';
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void _addToSearchHistory(String cityName) {
    if (!_searchHistory.contains(cityName)) {
      _searchHistory.insert(0, cityName);
      if (_searchHistory.length > 5) {
        _searchHistory.removeLast();
      }
    }
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }

  String getWeatherIcon(String iconCode) {
    switch (iconCode) {
      case '01d':
      case '01n':
        return '☀️';
      case '02d':
      case '02n':
      case '03d':
      case '03n':
        return '⛅';
      case '04d':
      case '04n':
        return '☁️';
      case '09d':
      case '09n':
        return '🌧️';
      case '10d':
      case '10n':
        return '🌦️';
      case '11d':
      case '11n':
        return '⛈️';
      case '13d':
      case '13n':
        return '❄️';
      case '50d':
      case '50n':
        return '🌫️';
      default:
        return '🌤️';
    }
  }

  Color getBackgroundColor(String iconCode) {
    switch (iconCode) {
      case '01d':
        return const Color(0xFF87CEEB);
      case '01n':
        return const Color(0xFF191970);
      case '02d':
      case '03d':
        return const Color(0xFF778899);
      case '02n':
      case '03n':
        return const Color(0xFF2F4F4F);
      case '04d':
      case '04n':
        return const Color(0xFF696969);
      case '09d':
      case '09n':
      case '10d':
      case '10n':
        return const Color(0xFF4682B4);
      case '11d':
      case '11n':
        return const Color(0xFF483D8B);
      case '13d':
      case '13n':
        return const Color(0xFFB0C4DE);
      case '50d':
      case '50n':
        return const Color(0xFFA9A9A9);
      default:
        return const Color(0xFF87CEEB);
    }
  }
}
