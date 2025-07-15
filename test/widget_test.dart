// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:weatherly/main.dart';
import 'package:weatherly/providers/weather_provider.dart';

void main() {
  testWidgets('Weather app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const WeatherlyApp());

    // Wait for the initial frame
    await tester.pump();

    // The app should load even if it shows loading or error state
    expect(find.byType(MaterialApp), findsOneWidget);

    // Check if we can find either the title or loading indicator
    final titleFinder = find.text('Weatherly');
    final loadingFinder = find.byType(CircularProgressIndicator);

    // At least one should be present
    expect(titleFinder.evaluate().isNotEmpty || loadingFinder.evaluate().isNotEmpty, isTrue);
  });

  testWidgets('Weather provider state test', (WidgetTester tester) async {
    // Test the weather provider
    final weatherProvider = WeatherProvider();

    // Test initial state
    expect(weatherProvider.currentWeather, isNull);
    expect(weatherProvider.isLoading, isFalse);
    expect(weatherProvider.error, isNull);
    expect(weatherProvider.searchHistory, isEmpty);
  });

  testWidgets('Weather icons mapping test', (WidgetTester tester) async {
    final weatherProvider = WeatherProvider();

    // Test weather icon mapping
    expect(weatherProvider.getWeatherIcon('01d'), '☀️');
    expect(weatherProvider.getWeatherIcon('02d'), '⛅');
    expect(weatherProvider.getWeatherIcon('09d'), '🌧️');
    expect(weatherProvider.getWeatherIcon('11d'), '⛈️');
    expect(weatherProvider.getWeatherIcon('13d'), '❄️');
  });

  testWidgets('Background color mapping test', (WidgetTester tester) async {
    final weatherProvider = WeatherProvider();

    // Test background color mapping
    expect(weatherProvider.getBackgroundColor('01d'), const Color(0xFF87CEEB));
    expect(weatherProvider.getBackgroundColor('01n'), const Color(0xFF191970));
    expect(weatherProvider.getBackgroundColor('09d'), const Color(0xFF4682B4));
  });
}
