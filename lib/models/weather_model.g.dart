// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeatherModelAdapter extends TypeAdapter<WeatherModel> {
  @override
  final int typeId = 0;

  @override
  WeatherModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherModel(
      cityName: fields[0] as String,
      temperature: fields[1] as double,
      description: fields[2] as String,
      icon: fields[3] as String,
      feelsLike: fields[4] as double,
      humidity: fields[5] as int,
      windSpeed: fields[6] as double,
      pressure: fields[7] as int,
      visibility: fields[8] as double,
      uvIndex: fields[9] as int,
      dateTime: fields[10] as DateTime,
      hourlyForecast: (fields[11] as List).cast<HourlyForecast>(),
      dailyForecast: (fields[12] as List).cast<DailyForecast>(),
    );
  }

  @override
  void write(BinaryWriter writer, WeatherModel obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.cityName)
      ..writeByte(1)
      ..write(obj.temperature)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.icon)
      ..writeByte(4)
      ..write(obj.feelsLike)
      ..writeByte(5)
      ..write(obj.humidity)
      ..writeByte(6)
      ..write(obj.windSpeed)
      ..writeByte(7)
      ..write(obj.pressure)
      ..writeByte(8)
      ..write(obj.visibility)
      ..writeByte(9)
      ..write(obj.uvIndex)
      ..writeByte(10)
      ..write(obj.dateTime)
      ..writeByte(11)
      ..write(obj.hourlyForecast)
      ..writeByte(12)
      ..write(obj.dailyForecast);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HourlyForecastAdapter extends TypeAdapter<HourlyForecast> {
  @override
  final int typeId = 1;

  @override
  HourlyForecast read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HourlyForecast(
      time: fields[0] as DateTime,
      temperature: fields[1] as double,
      icon: fields[2] as String,
      description: fields[3] as String,
      humidity: fields[4] as int,
      windSpeed: fields[5] as double,
    );
  }

  @override
  void write(BinaryWriter writer, HourlyForecast obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.time)
      ..writeByte(1)
      ..write(obj.temperature)
      ..writeByte(2)
      ..write(obj.icon)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.humidity)
      ..writeByte(5)
      ..write(obj.windSpeed);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HourlyForecastAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DailyForecastAdapter extends TypeAdapter<DailyForecast> {
  @override
  final int typeId = 2;

  @override
  DailyForecast read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DailyForecast(
      date: fields[0] as DateTime,
      maxTemp: fields[1] as double,
      minTemp: fields[2] as double,
      icon: fields[3] as String,
      description: fields[4] as String,
      humidity: fields[5] as int,
      windSpeed: fields[6] as double,
      chanceOfRain: fields[7] as double,
    );
  }

  @override
  void write(BinaryWriter writer, DailyForecast obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.maxTemp)
      ..writeByte(2)
      ..write(obj.minTemp)
      ..writeByte(3)
      ..write(obj.icon)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.humidity)
      ..writeByte(6)
      ..write(obj.windSpeed)
      ..writeByte(7)
      ..write(obj.chanceOfRain);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DailyForecastAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
