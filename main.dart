import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/home_page.dart';
import 'pages/weather_details_page.dart';
import 'pages/favorites_page.dart';
import 'pages/settings_page.dart';
import 'services/storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SettingsProvider(),
      child: Consumer<SettingsProvider>(
        builder: (context, settings, _) {
          return MaterialApp(
            title: 'Weather App',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              scaffoldBackgroundColor: Colors.grey[100],
              appBarTheme: const AppBarTheme(
                elevation: 0,
                centerTitle: true,
              ),
            ),
            initialRoute: '/',
            routes: {
              '/': (context) => const HomePage(),
              '/weather-details': (context) => const WeatherDetailsPage(),
              '/favorites': (context) => const FavoritesPage(),
              '/settings': (context) => const SettingsPage(),
            },
          );
        },
      ),
    );
  }
}

class SettingsProvider extends ChangeNotifier {
  bool _isMetric = true;

  bool get isMetric => _isMetric;
  String get unit => _isMetric ? 'metric' : 'imperial';
  String get tempUnit => _isMetric ? '°C' : '°F';

  SettingsProvider() {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    _isMetric = await StorageService.getTemperatureUnit();
    notifyListeners();
  }

  Future<void> toggleUnit() async {
    _isMetric = !_isMetric;
    await StorageService.setTemperatureUnit(_isMetric);
    notifyListeners();
  }
}