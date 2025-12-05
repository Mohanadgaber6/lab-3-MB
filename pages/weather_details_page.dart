import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/weather_model.dart';
import '../services/api_service.dart';
import '../services/storage_service.dart';
import '../main.dart';

class WeatherDetailsPage extends StatefulWidget {
  const WeatherDetailsPage({Key? key}) : super(key: key);

  @override
  State<WeatherDetailsPage> createState() => _WeatherDetailsPageState();
}

class _WeatherDetailsPageState extends State<WeatherDetailsPage> {
  bool _isFavorite = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _checkFavorite();
  }

  Future<void> _checkFavorite() async {
    final weather = ModalRoute.of(context)!.settings.arguments as WeatherModel;
    final isFav = await StorageService.isFavorite(weather.cityName);
    setState(() {
      _isFavorite = isFav;
    });
  }

  Future<void> _toggleFavorite(WeatherModel weather) async {
    if (_isFavorite) {
      await StorageService.removeFavorite(weather.cityName);
    } else {
      await StorageService.addFavorite(weather.cityName);
    }
    setState(() {
      _isFavorite = !_isFavorite;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _isFavorite
              ? '${weather.cityName} added to favorites'
              : '${weather.cityName} removed from favorites',
        ),
      ),
    );
  }

  String _formatTime(int timestamp, int timezoneOffset) {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(
      (timestamp + timezoneOffset) * 1000,
      isUtc: true,
    );
    return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }

  String _getLocalTime(int timezoneOffset) {
    final now = DateTime.now().toUtc();
    final localTime = now.add(Duration(seconds: timezoneOffset));
    return '${localTime.hour.toString().padLeft(2, '0')}:${localTime.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final weather = ModalRoute.of(context)!.settings.arguments as WeatherModel;
    final settings = Provider.of<SettingsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(weather.cityName),
        actions: [
          IconButton(
            icon: Icon(_isFavorite ? Icons.favorite : Icons.favorite_border),
            onPressed: () => _toggleFavorite(weather),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // Implement refresh logic here
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Main Weather Card
              Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [Colors.blue[400]!, Colors.blue[600]!],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Column(
                    children: [
                      Image.network(
                        ApiService.getIconUrl(weather.icon),
                        width: 100,
                        height: 100,
                      ),
                      Text(
                        '${weather.temperature.round()}${settings.tempUnit}',
                        style: const TextStyle(
                          fontSize: 64,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        weather.description.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Feels like ${weather.feelsLike.round()}${settings.tempUnit}',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Local Time
              Card(
                child: ListTile(
                  leading: const Icon(Icons.access_time, color: Colors.blue),
                  title: const Text('Local Time'),
                  trailing: Text(
                    _getLocalTime(weather.timezone),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              // Weather Details Grid
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio: 1.5,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                padding: const EdgeInsets.symmetric(vertical: 16),
                children: [
                  _buildDetailCard(
                    'Humidity',
                    '${weather.humidity}%',
                    Icons.water_drop,
                    Colors.blue,
                  ),
                  _buildDetailCard(
                    'Wind Speed',
                    '${weather.windSpeed.toStringAsFixed(1)} m/s',
                    Icons.air,
                    Colors.teal,
                  ),
                  _buildDetailCard(
                    'Sunrise',
                    _formatTime(weather.sunrise, weather.timezone),
                    Icons.wb_sunny,
                    Colors.orange,
                  ),
                  _buildDetailCard(
                    'Sunset',
                    _formatTime(weather.sunset, weather.timezone),
                    Icons.nights_stay,
                    Colors.deepPurple,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailCard(
      String title,
      String value,
      IconData icon,
      Color color,
      ) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 32, color: color),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}