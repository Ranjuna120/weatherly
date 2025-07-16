# 🌤️ Weatherly - Modern Weather App

A beautiful, feature-rich weather application built with Flutter featuring elegant UI, comprehensive weather data, favorites management, and customizable settings.

## ✨ Key Features

### 🌍 **Weather Information**
- **Real-time Weather**: Current conditions with location-based detection
- **Hourly & Daily Forecasts**: 24-hour and 7-day weather predictions
- **Detailed Metrics**: Temperature, humidity, wind speed, feels-like temperature
- **Weather Icons**: Beautiful emoji-based weather representations
- **Dynamic Backgrounds**: Colors adapt to current weather conditions

### 📱 **Enhanced Navigation**
- **Bottom Navigation**: Seamless switching between screens
- **Home Screen**: Main weather display with animations
- **Favorites Screen**: Save and manage favorite cities
- **Settings Screen**: Customizable app preferences

### ❤️ **Favorites Management**
- **Save Cities**: Add frequently checked locations
- **Beautiful Cards**: Gradient weather cards for each city
- **Quick Access**: Instant weather updates for saved cities
- **Remove Favorites**: Easy management with confirmation dialogs

### ⚙️ **Customization Settings**
- **Temperature Units**: Switch between Celsius and Fahrenheit
- **Dark Mode**: Toggle between light and dark themes
- **Notifications**: Weather alerts and daily forecast options
- **Data Management**: Clear app data and reset preferences

### 🎨 **Beautiful UI/UX**
- **Material Design 3**: Modern, clean interface
- **Smooth Animations**: Staggered animations with flutter_staggered_animations
- **Responsive Design**: Works perfectly on all screen sizes
- **Glass Morphism**: Translucent effects and beautiful gradients
- **Pull-to-Refresh**: Easy data updates

### 🔍 **Smart Search**
- **City Search**: Find weather for any city worldwide
- **Search History**: Recently searched locations
- **Auto-suggestions**: Quick city selection

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

## 📂 App Architecture

```
lib/
├── main.dart                   # App entry point with Provider and theme setup
├── models/
│   ├── weather_model.dart      # Weather data models with JSON serialization
│   └── weather_model.g.dart    # Generated JSON serialization code
├── providers/
│   └── weather_provider.dart   # State management, settings, and favorites
├── screens/
│   ├── home_screen.dart        # Bottom navigation container
│   ├── weather_screen.dart     # Main weather display
│   ├── favorites_screen.dart   # Favorite cities management
│   ├── settings_screen.dart    # App settings and preferences
│   └── search_screen.dart      # City search functionality
├── services/
│   └── weather_service.dart    # Weather API service layer
└── widgets/
    ├── weather_card.dart       # Main weather information card
    ├── weather_details.dart    # Detailed weather metrics
    ├── hourly_forecast.dart    # 24-hour forecast widget
    └── daily_forecast.dart     # 7-day forecast widget
```

## 🛠️ Technologies & Dependencies

### **Core Framework**
- **Flutter 3.8.1+**: Cross-platform mobile development
- **Dart**: Programming language

### **State Management & Storage**
- **Provider 6.1.1**: Reactive state management
- **Shared Preferences 2.2.2**: Local data persistence

### **Network & Location**
- **HTTP 1.1.0**: API requests and network calls
- **Geolocator 10.1.0**: GPS location services

### **UI & Animations**
- **Flutter Staggered Animations**: Smooth UI transitions
- **Material Design 3**: Google's latest design system
- **Cupertino Icons**: iOS-style icons

### **Data Handling**
- **JSON Annotation**: Type-safe JSON serialization
- **Build Runner**: Code generation tools

## 📱 App Screens

### 🏠 **Home Screen**
- Clean, modern weather display with gradient backgrounds
- Location-based weather detection
- Add/remove cities from favorites
- Pull-to-refresh functionality

### ❤️ **Favorites Screen**
- Beautiful weather cards for saved cities
- Gradient backgrounds matching weather conditions
- Loading states and error handling
- Easy removal with confirmation dialogs

### ⚙️ **Settings Screen**
- Temperature unit conversion (°C/°F)
- Dark mode toggle
- Notification preferences
- Privacy policy and terms
- Clear all data option

## 🎯 Why Choose Weatherly?

✅ **Modern Design**: Beautiful, intuitive UI following Material Design 3  
✅ **Complete Features**: Weather data, forecasts, favorites, and settings  
✅ **Smooth Performance**: Optimized animations and efficient state management  
✅ **Customizable**: Temperature units, themes, and notification preferences  
✅ **User-Friendly**: Easy navigation with bottom tab bar  
✅ **Offline Ready**: Cached data and smooth error handling  

## 📸 Features Showcase

- 🌈 **Dynamic themes** that change with weather conditions
- 🔄 **Smooth animations** with staggered effects
- 📍 **Location detection** for instant weather updates
- 💾 **Data persistence** for favorites and settings
- 🎨 **Glass morphism** design with translucent effects
- 📱 **Responsive design** for all screen sizes

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
