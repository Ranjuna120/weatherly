import 'package:hive_flutter/hive_flutter.dart';
import '../models/weather_model.dart';

class DatabaseService {
  static const String _favoritesBoxName = 'favorites';
  static const String _weatherDataBoxName = 'weather_data';
  static const String _settingsBoxName = 'settings';

  // Initialize Hive database
  static Future<void> init() async {
    await Hive.initFlutter();

    // Register adapters
    Hive.registerAdapter(WeatherModelAdapter());
    Hive.registerAdapter(HourlyForecastAdapter());
    Hive.registerAdapter(DailyForecastAdapter());

    // Open boxes
    await Hive.openBox<String>(_favoritesBoxName);
    await Hive.openBox<WeatherModel>(_weatherDataBoxName);
    await Hive.openBox(_settingsBoxName);
  }

  // Favorites operations
  static Box<String> get _favoritesBox => Hive.box<String>(_favoritesBoxName);

  static List<String> getFavoriteCities() {
    return _favoritesBox.values.toList();
  }

  static Future<void> addToFavorites(String cityName) async {
    if (!_favoritesBox.values.contains(cityName)) {
      await _favoritesBox.add(cityName);
    }
  }

  static Future<void> removeFromFavorites(String cityName) async {
    final key = _favoritesBox.keys.firstWhere((key) => _favoritesBox.get(key) == cityName, orElse: () => null);
    if (key != null) {
      await _favoritesBox.delete(key);
    }
  }

  static Future<void> clearFavorites() async {
    await _favoritesBox.clear();
  }

  // Weather data operations
  static Box<WeatherModel> get _weatherDataBox => Hive.box<WeatherModel>(_weatherDataBoxName);

  static Future<void> saveWeatherData(String cityName, WeatherModel weather) async {
    await _weatherDataBox.put(cityName.toLowerCase(), weather);
  }

  static WeatherModel? getWeatherData(String cityName) {
    return _weatherDataBox.get(cityName.toLowerCase());
  }

  static Map<String, WeatherModel> getAllWeatherData() {
    final Map<String, WeatherModel> result = {};
    for (var key in _weatherDataBox.keys) {
      final weather = _weatherDataBox.get(key);
      if (weather != null) {
        result[key] = weather;
      }
    }
    return result;
  }

  static Future<void> clearWeatherData() async {
    await _weatherDataBox.clear();
  }

  // Settings operations
  static Box get _settingsBox => Hive.box(_settingsBoxName);

  static Future<void> saveSetting(String key, dynamic value) async {
    await _settingsBox.put(key, value);
  }

  static T? getSetting<T>(String key, {T? defaultValue}) {
    return _settingsBox.get(key, defaultValue: defaultValue) as T?;
  }

  static Future<void> clearSettings() async {
    await _settingsBox.clear();
  }

  // Clear all data
  static Future<void> clearAllData() async {
    await _favoritesBox.clear();
    await _weatherDataBox.clear();
    await _settingsBox.clear();
  }

  // Close all boxes (call on app shutdown)
  static Future<void> close() async {
    await Hive.close();
  }
}
