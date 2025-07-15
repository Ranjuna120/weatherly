import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Settings', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: Consumer<WeatherProvider>(
        builder: (context, weatherProvider, child) {
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // Temperature Unit Setting
              _buildSettingsCard('Temperature Unit', [
                ListTile(
                  title: const Text('Celsius (°C)'),
                  leading: Radio<String>(
                    value: 'celsius',
                    groupValue: weatherProvider.temperatureUnit,
                    onChanged: (value) {
                      if (value != null) {
                        weatherProvider.setTemperatureUnit(value);
                      }
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Fahrenheit (°F)'),
                  leading: Radio<String>(
                    value: 'fahrenheit',
                    groupValue: weatherProvider.temperatureUnit,
                    onChanged: (value) {
                      if (value != null) {
                        weatherProvider.setTemperatureUnit(value);
                      }
                    },
                  ),
                ),
              ]),

              const SizedBox(height: 16),

              // Theme Setting
              _buildSettingsCard('Appearance', [
                ListTile(
                  title: const Text('Dark Mode'),
                  subtitle: const Text('Switch between light and dark theme'),
                  trailing: Switch(
                    value: weatherProvider.isDarkMode,
                    onChanged: (value) {
                      weatherProvider.setDarkMode(value);
                    },
                  ),
                ),
              ]),

              const SizedBox(height: 16),

              // Notifications Setting
              _buildSettingsCard('Notifications', [
                ListTile(
                  title: const Text('Weather Alerts'),
                  subtitle: const Text('Receive severe weather notifications'),
                  trailing: Switch(
                    value: weatherProvider.weatherAlerts,
                    onChanged: (value) {
                      weatherProvider.setWeatherAlerts(value);
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Daily Forecast'),
                  subtitle: const Text('Get daily weather updates'),
                  trailing: Switch(
                    value: weatherProvider.dailyNotifications,
                    onChanged: (value) {
                      weatherProvider.setDailyNotifications(value);
                    },
                  ),
                ),
              ]),

              const SizedBox(height: 16),

              // About Section
              _buildSettingsCard('About', [
                ListTile(
                  title: const Text('Version'),
                  subtitle: const Text('1.0.0'),
                  leading: const Icon(Icons.info_outline),
                ),
                ListTile(
                  title: const Text('Privacy Policy'),
                  leading: const Icon(Icons.privacy_tip_outlined),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    _showPrivacyPolicy(context);
                  },
                ),
                ListTile(
                  title: const Text('Terms of Service'),
                  leading: const Icon(Icons.description_outlined),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    _showTermsOfService(context);
                  },
                ),
              ]),

              const SizedBox(height: 32),

              // Clear Data Button
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    _showClearDataDialog(context, weatherProvider);
                  },
                  icon: const Icon(Icons.delete_outline),
                  label: const Text('Clear All Data'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[600],
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSettingsCard(String title, List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
          ),
          ...children,
        ],
      ),
    );
  }

  void _showClearDataDialog(BuildContext context, WeatherProvider provider) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Clear All Data'),
          content: const Text(
            'This will remove all your favorites, search history, and settings. This action cannot be undone.',
          ),
          actions: [
            TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Cancel')),
            TextButton(
              onPressed: () {
                provider.clearAllData();
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('All data cleared')));
              },
              child: const Text('Clear', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  void _showPrivacyPolicy(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Privacy Policy'),
          content: const SingleChildScrollView(
            child: Text(
              'Weatherly respects your privacy. This app:\n\n'
              '• Uses your location only to provide weather information\n'
              '• Stores your preferences locally on your device\n'
              '• Does not share your personal data with third parties\n'
              '• Uses weather data from OpenWeatherMap API\n'
              '• Does not collect any analytics or tracking data\n\n'
              'For questions about privacy, please contact the developer.',
            ),
          ),
          actions: [TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Close'))],
        );
      },
    );
  }

  void _showTermsOfService(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Terms of Service'),
          content: const SingleChildScrollView(
            child: Text(
              'By using Weatherly, you agree to:\n\n'
              '• Use the app for personal weather information only\n'
              '• Not attempt to reverse engineer or modify the app\n'
              '• Understand that weather data may not always be 100% accurate\n'
              '• Allow the app to access your location for weather services\n'
              '• Accept that the app is provided "as is" without warranties\n\n'
              'The developer is not responsible for any decisions made based on weather information provided by this app.',
            ),
          ),
          actions: [TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Close'))],
        );
      },
    );
  }
}
