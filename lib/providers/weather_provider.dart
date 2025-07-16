import 'package:flutter/material.dart';
import '../models/weather_model.dart';
import '../services/weather_service.dart';
import '../services/database_service.dart';

class WeatherProvider with ChangeNotifier {
  final WeatherService _weatherService = WeatherService();

  WeatherModel? _currentWeather;
  bool _isLoading = false;
  String? _error;
  final List<String> _searchHistory = [];

  // Settings
  String _temperatureUnit = 'celsius';
  bool _isDarkMode = false;
  bool _weatherAlerts = true;
  bool _dailyNotifications = false;

  // Favorites
  final List<String> _favoriteCities = [];
  final Map<String, WeatherModel> _favoriteWeatherData = {};

  // Getters
  String get temperatureUnit => _temperatureUnit;
  bool get isDarkMode => _isDarkMode;
  bool get weatherAlerts => _weatherAlerts;
  bool get dailyNotifications => _dailyNotifications;
  List<String> get favoriteCities => _favoriteCities;
  Map<String, WeatherModel> get favoriteWeatherData => _favoriteWeatherData;

  WeatherModel? get currentWeather => _currentWeather;
  bool get isLoading => _isLoading;
  String? get error => _error;
  List<String> get searchHistory => _searchHistory;

  // Initialize provider
  WeatherProvider() {
    _loadSettings();
    _loadFavorites();
  }

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

  // Settings methods
  Future<void> _loadSettings() async {
    try {
      _temperatureUnit = DatabaseService.getSetting('temperature_unit', defaultValue: 'celsius') ?? 'celsius';
      _isDarkMode = DatabaseService.getSetting('dark_mode', defaultValue: false) ?? false;
      _weatherAlerts = DatabaseService.getSetting('weather_alerts', defaultValue: true) ?? true;
      _dailyNotifications = DatabaseService.getSetting('daily_notifications', defaultValue: false) ?? false;
      notifyListeners();
    } catch (e) {
      // Handle error silently
    }
  }

  Future<void> setTemperatureUnit(String unit) async {
    _temperatureUnit = unit;
    notifyListeners();
    try {
      await DatabaseService.saveSetting('temperature_unit', unit);
    } catch (e) {
      // Handle error silently
    }
  }

  Future<void> setDarkMode(bool value) async {
    _isDarkMode = value;
    notifyListeners();
    try {
      await DatabaseService.saveSetting('dark_mode', value);
    } catch (e) {
      // Handle error silently
    }
  }

  Future<void> setWeatherAlerts(bool value) async {
    _weatherAlerts = value;
    notifyListeners();
    try {
      await DatabaseService.saveSetting('weather_alerts', value);
    } catch (e) {
      // Handle error silently
    }
  }

  Future<void> setDailyNotifications(bool value) async {
    _dailyNotifications = value;
    notifyListeners();
    try {
      await DatabaseService.saveSetting('daily_notifications', value);
    } catch (e) {
      // Handle error silently
    }
  }

  // Favorites methods
  Future<void> _loadFavorites() async {
    try {
      final favorites = DatabaseService.getFavoriteCities();
      _favoriteCities.clear();
      _favoriteCities.addAll(favorites);

      // Load weather data for favorites
      final weatherData = DatabaseService.getAllWeatherData();
      _favoriteWeatherData.clear();
      _favoriteWeatherData.addAll(weatherData);

      notifyListeners();
    } catch (e) {
      // Handle error silently
    }
  }

  Future<void> loadFavorites() async {
    await _loadFavorites();
    await refreshFavorites();
  }

  Future<void> addToFavorites(String cityName) async {
    if (!_favoriteCities.contains(cityName)) {
      _favoriteCities.add(cityName);
      notifyListeners();
      try {
        await DatabaseService.addToFavorites(cityName);

        // Load weather data for the new favorite
        await _loadWeatherForCity(cityName);
      } catch (e) {
        // Handle error silently
      }
    }
  }

  Future<void> removeFromFavorites(String cityName) async {
    _favoriteCities.remove(cityName);
    _favoriteWeatherData.remove(cityName);
    notifyListeners();
    try {
      await DatabaseService.removeFromFavorites(cityName);
    } catch (e) {
      // Handle error silently
    }
  }

  Future<void> refreshFavorites() async {
    for (String city in _favoriteCities) {
      await _loadWeatherForCity(city);
    }
  }

  Future<void> _loadWeatherForCity(String cityName) async {
    try {
      final weather = await _weatherService.getWeatherByCity(cityName);
      _favoriteWeatherData[cityName] = weather;

      // Save to database
      await DatabaseService.saveWeatherData(cityName, weather);

      notifyListeners();
    } catch (e) {
      // Handle error silently
    }
  }

  Future<void> clearAllData() async {
    try {
      await DatabaseService.clearAllData();

      _favoriteCities.clear();
      _favoriteWeatherData.clear();
      _searchHistory.clear();
      _temperatureUnit = 'celsius';
      _isDarkMode = false;
      _weatherAlerts = true;
      _dailyNotifications = false;

      notifyListeners();
    } catch (e) {
      // Handle error silently
    }
  }

  // Temperature conversion
  String formatTemperature(double temperature) {
    if (_temperatureUnit == 'fahrenheit') {
      final fahrenheit = (temperature * 9 / 5) + 32;
      return '${fahrenheit.round()}°F';
    }
    return '${temperature.round()}°C';
  }
}
