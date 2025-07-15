// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) => WeatherModel(
  cityName: json['cityName'] as String,
  temperature: (json['temperature'] as num).toDouble(),
  description: json['description'] as String,
  icon: json['icon'] as String,
  feelsLike: (json['feelsLike'] as num).toDouble(),
  humidity: (json['humidity'] as num).toInt(),
  windSpeed: (json['windSpeed'] as num).toDouble(),
  pressure: (json['pressure'] as num).toInt(),
  visibility: (json['visibility'] as num).toDouble(),
  uvIndex: (json['uvIndex'] as num).toInt(),
  dateTime: DateTime.parse(json['dateTime'] as String),
  hourlyForecast: (json['hourlyForecast'] as List<dynamic>)
      .map((e) => HourlyForecast.fromJson(e as Map<String, dynamic>))
      .toList(),
  dailyForecast: (json['dailyForecast'] as List<dynamic>)
      .map((e) => DailyForecast.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$WeatherModelToJson(WeatherModel instance) =>
    <String, dynamic>{
      'cityName': instance.cityName,
      'temperature': instance.temperature,
      'description': instance.description,
      'icon': instance.icon,
      'feelsLike': instance.feelsLike,
      'humidity': instance.humidity,
      'windSpeed': instance.windSpeed,
      'pressure': instance.pressure,
      'visibility': instance.visibility,
      'uvIndex': instance.uvIndex,
      'dateTime': instance.dateTime.toIso8601String(),
      'hourlyForecast': instance.hourlyForecast,
      'dailyForecast': instance.dailyForecast,
    };

HourlyForecast _$HourlyForecastFromJson(Map<String, dynamic> json) =>
    HourlyForecast(
      time: DateTime.parse(json['time'] as String),
      temperature: (json['temperature'] as num).toDouble(),
      icon: json['icon'] as String,
      description: json['description'] as String,
      humidity: (json['humidity'] as num).toInt(),
      windSpeed: (json['windSpeed'] as num).toDouble(),
    );

Map<String, dynamic> _$HourlyForecastToJson(HourlyForecast instance) =>
    <String, dynamic>{
      'time': instance.time.toIso8601String(),
      'temperature': instance.temperature,
      'icon': instance.icon,
      'description': instance.description,
      'humidity': instance.humidity,
      'windSpeed': instance.windSpeed,
    };

DailyForecast _$DailyForecastFromJson(Map<String, dynamic> json) =>
    DailyForecast(
      date: DateTime.parse(json['date'] as String),
      maxTemp: (json['maxTemp'] as num).toDouble(),
      minTemp: (json['minTemp'] as num).toDouble(),
      icon: json['icon'] as String,
      description: json['description'] as String,
      humidity: (json['humidity'] as num).toInt(),
      windSpeed: (json['windSpeed'] as num).toDouble(),
      chanceOfRain: (json['chanceOfRain'] as num).toDouble(),
    );

Map<String, dynamic> _$DailyForecastToJson(DailyForecast instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'maxTemp': instance.maxTemp,
      'minTemp': instance.minTemp,
      'icon': instance.icon,
      'description': instance.description,
      'humidity': instance.humidity,
      'windSpeed': instance.windSpeed,
      'chanceOfRain': instance.chanceOfRain,
    };
