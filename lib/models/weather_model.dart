import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';

part 'weather_model.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class WeatherModel {
  @HiveField(0)
  final String cityName;

  @HiveField(1)
  final double temperature;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final String icon;

  @HiveField(4)
  final double feelsLike;

  @HiveField(5)
  final int humidity;

  @HiveField(6)
  final double windSpeed;

  @HiveField(7)
  final int pressure;

  @HiveField(8)
  final double visibility;

  @HiveField(9)
  final int uvIndex;

  @HiveField(10)
  final DateTime dateTime;

  @HiveField(11)
  final List<HourlyForecast> hourlyForecast;

  @HiveField(12)
  final List<DailyForecast> dailyForecast;

  WeatherModel({
    required this.cityName,
    required this.temperature,
    required this.description,
    required this.icon,
    required this.feelsLike,
    required this.humidity,
    required this.windSpeed,
    required this.pressure,
    required this.visibility,
    required this.uvIndex,
    required this.dateTime,
    required this.hourlyForecast,
    required this.dailyForecast,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => _$WeatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);
}

@HiveType(typeId: 1)
@JsonSerializable()
class HourlyForecast {
  @HiveField(0)
  final DateTime time;

  @HiveField(1)
  final double temperature;

  @HiveField(2)
  final String icon;

  @HiveField(3)
  final String description;

  @HiveField(4)
  final int humidity;

  @HiveField(5)
  final double windSpeed;

  HourlyForecast({
    required this.time,
    required this.temperature,
    required this.icon,
    required this.description,
    required this.humidity,
    required this.windSpeed,
  });

  factory HourlyForecast.fromJson(Map<String, dynamic> json) => _$HourlyForecastFromJson(json);

  Map<String, dynamic> toJson() => _$HourlyForecastToJson(this);
}

@HiveType(typeId: 2)
@JsonSerializable()
class DailyForecast {
  @HiveField(0)
  final DateTime date;

  @HiveField(1)
  final double maxTemp;

  @HiveField(2)
  final double minTemp;

  @HiveField(3)
  final String icon;

  @HiveField(4)
  final String description;

  @HiveField(5)
  final int humidity;

  @HiveField(6)
  final double windSpeed;

  @HiveField(7)
  final double chanceOfRain;

  DailyForecast({
    required this.date,
    required this.maxTemp,
    required this.minTemp,
    required this.icon,
    required this.description,
    required this.humidity,
    required this.windSpeed,
    required this.chanceOfRain,
  });

  factory DailyForecast.fromJson(Map<String, dynamic> json) => _$DailyForecastFromJson(json);

  Map<String, dynamic> toJson() => _$DailyForecastToJson(this);
}
