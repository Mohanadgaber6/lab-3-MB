import 'package:flutter/material.dart';
import '../models/weather_model.dart';
import '../services/api_service.dart';

/// Reusable Weather Card Widget
/// Displays weather information in a card format
class WeatherCard extends StatelessWidget {
  final WeatherModel weather;
  final String tempUnit;
  final VoidCallback? onTap;

  const WeatherCard({
    Key? key,
    required this.weather,
    required this.tempUnit,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [Colors.blue[300]!, Colors.blue[500]!],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // City Name
              Text(
                weather.cityName,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),

              // Weather Icon
              Image.network(
                ApiService.getIconUrl(weather.icon),
                width: 80,
                height: 80,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.cloud,
                    size: 80,
                    color: Colors.white,
                  );
                },
              ),

              // Temperature
              Text(
                '${weather.temperature.round()}$tempUnit',
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              // Description
              Text(
                weather.description.toUpperCase(),
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  letterSpacing: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),

              // Additional Info
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildInfoItem(
                    Icons.water_drop,
                    '${weather.humidity}%',
                    'Humidity',
                  ),
                  _buildInfoItem(
                    Icons.air,
                    '${weather.windSpeed.toStringAsFixed(1)} m/s',
                    'Wind',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.white70, size: 20),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

/// Mini Weather Card for list views
class WeatherCardMini extends StatelessWidget {
  final String cityName;
  final String temperature;
  final String icon;
  final VoidCallback? onTap;

  const WeatherCardMini({
    Key? key,
    required this.cityName,
    required this.temperature,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: ListTile(
        onTap: onTap,
        leading: Image.network(
          ApiService.getIconUrl(icon),
          width: 50,
          height: 50,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.cloud, size: 50);
          },
        ),
        title: Text(
          cityName,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: Text(
          temperature,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}