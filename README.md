# 🌤️ Weatherly - Beautiful Weather App

A modern, feature-rich weather application built with Flutter that provides comprehensive weather information with stunning visuals and smooth animations.

## ✨ Features

### � **Weather Data**
- **Current Weather**: Real-time conditions with temperature, humidity, wind speed
- **Feels Like Temperature**: Human-perceived temperature
- **Weather Details**: Pressure, visibility, UV index
- **Location Services**: GPS-based weather detection
- **City Search**: Search weather by city name worldwide

### � **Forecasts**
- **24-Hour Forecast**: Hourly weather predictions
- **7-Day Forecast**: Daily weather with min/max temperatures
- **Rain Probability**: Chance of precipitation
- **Weather Icons**: Beautiful emoji-based weather representations

### 🎨 **User Interface**
- **Dynamic Backgrounds**: Colors adapt to weather conditions
- **Glass Morphism Design**: Modern translucent card effects
- **Smooth Animations**: Staggered animations for better UX
- **Responsive Layout**: Works on all screen sizes
- **Pull-to-Refresh**: Easy data refresh functionality

### 🔍 **Search & History**
- **Smart Search**: Quick city name search
- **Search History**: Recently searched locations
- **Auto-complete**: Efficient city selection

## 📱 Screenshots

The app features:
- **Dynamic Weather Themes**: Background colors change based on weather conditions
- **Clean Material Design**: Following Google's design principles
- **Intuitive Navigation**: Easy-to-use interface
- **Beautiful Weather Cards**: Elegant display of weather information

## 🚀 Getting Started

### Prerequisites

- Flutter SDK 3.8.1 or higher
- Dart SDK
- Android Studio / VS Code
- Android/iOS device or emulator

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/weatherly.git
   cd weatherly
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate required files**
   ```bash
   flutter packages pub run build_runner build
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

### 🔧 Development Setup

The project includes VS Code configuration files:
- **Launch Configuration**: Debug and profile modes
- **Tasks**: Flutter run task
- **Settings**: Optimized Dart/Flutter settings

## 📂 Project Architecture

```
lib/
├── main.dart                 # App entry point with Provider setup
├── models/
│   ├── weather_model.dart    # Weather data models
│   └── weather_model.g.dart  # Generated JSON serialization
├── providers/
│   └── weather_provider.dart # State management with ChangeNotifier
├── screens/
│   ├── weather_screen.dart   # Main weather display screen
│   └── search_screen.dart    # City search functionality
├── services/
│   └── weather_service.dart  # Weather API service layer
└── widgets/
    ├── weather_card.dart     # Main weather information card
    ├── weather_details.dart  # Detailed weather metrics
    ├── hourly_forecast.dart  # 24-hour forecast widget
    └── daily_forecast.dart   # 7-day forecast widget
```

## 🛠️ Technologies & Packages

### Core Framework
- **Flutter**: Cross-platform mobile development
- **Dart**: Programming language

### State Management
- **Provider**: Simple and efficient state management

### Network & Location
- **HTTP**: API requests
- **Geolocator**: Location services and GPS

### Data Handling
- **JSON Annotation**: JSON serialization
- **Shared Preferences**: Local data storage

### UI & Animations
- **Flutter Staggered Animations**: Smooth UI transitions
- **Material Design**: Google's design system

## 🌐 API Integration

Currently uses mock data for demonstration. To integrate real weather data:

1. **Get API Key**: Register at [OpenWeatherMap](https://openweathermap.org/api)
2. **Update Service**: Replace `YOUR_API_KEY_HERE` in `weather_service.dart`
3. **Enable Real API**: Uncomment the actual API implementation

### Mock Data Benefits
- **Immediate Testing**: No API key required
- **Comprehensive Data**: Full feature demonstration
- **Offline Development**: Works without internet

## 📱 Permissions

### Android
```xml
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
<uses-permission android:name="android.permission.INTERNET" />
```

### iOS
Location permissions are handled automatically by the geolocator package.

## 🧪 Testing

Run tests with:
```bash
flutter test
```

### Test Coverage
- **Widget Tests**: UI component testing
- **Provider Tests**: State management validation
- **Unit Tests**: Weather icon and color mapping

## 🎨 Customization

### Weather Themes
Modify `weather_provider.dart` to customize:
- Background colors for different weather conditions
- Weather icon mappings
- UI color schemes

### Adding Features
- **New Weather Metrics**: Extend `WeatherModel`
- **Additional Forecasts**: Add more forecast types
- **Custom Animations**: Enhance UI transitions
- **Weather Alerts**: Add notification system

## 🏗️ Building for Production

### Android
```bash
flutter build apk --release
# or
flutter build appbundle --release
```

### iOS
```bash
flutter build ios --release
```

## 📋 TODO / Future Enhancements

- [ ] **Weather Alerts**: Severe weather notifications
- [ ] **Multiple Locations**: Save favorite cities
- [ ] **Weather Maps**: Radar and satellite imagery
- [ ] **Widgets**: Home screen weather widgets
- [ ] **Dark Mode**: Theme switching
- [ ] **Units**: Metric/Imperial conversion
- [ ] **Offline Mode**: Cached weather data
- [ ] **Weather Charts**: Temperature and precipitation graphs

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit changes (`git commit -m 'Add amazing feature'`)
4. Push to branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Development Guidelines
- Follow Dart/Flutter style guide
- Write tests for new features
- Update documentation
- Use meaningful commit messages

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

Created with ❤️ using Flutter

## 🙏 Acknowledgments

- **OpenWeatherMap**: Weather data API
- **Flutter Team**: Amazing framework
- **Material Design**: Beautiful design system
- **Community**: Flutter packages and resources

---

**Weatherly** - Your beautiful, reliable weather companion! 🌈
