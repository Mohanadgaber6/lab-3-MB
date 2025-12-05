import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather_model.dart';
import '../config/api_config.dart';

class ApiService {
  /// Fetch weather data by city name
  static Future<WeatherModel> getWeatherByCity(
      String city, {
        String units = 'metric',
      }) async {
    if (!ApiConfig.isConfigured) {
      throw Exception('API key not configured. Please add your OpenWeatherMap API key in lib/config/api_config.dart');
    }

    final url = Uri.parse(
      '${ApiConfig.baseUrl}/weather?q=$city&appid=${ApiConfig.apiKey}&units=$units',
    );

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return WeatherModel.fromJson(data);
      } else if (response.statusCode == 404) {
        throw Exception('City not found');
      } else if (response.statusCode == 401) {
        throw Exception('Invalid API key');
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      if (e.toString().contains('SocketException')) {
        throw Exception('No internet connection');
      }
      rethrow;
    }
  }

  /// Fetch weather data by coordinates (optional)
  static Future<WeatherModel> getWeatherByCoordinates(
      double lat,
      double lon, {
        String units = 'metric',
      }) async {
    if (!ApiConfig.isConfigured) {
      throw Exception('API key not configured');
    }

    final url = Uri.parse(
      '${ApiConfig.baseUrl}/weather?lat=$lat&lon=$lon&appid=${ApiConfig.apiKey}&units=$units',
    );

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return WeatherModel.fromJson(data);
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      if (e.toString().contains('SocketException')) {
        throw Exception('No internet connection');
      }
      rethrow;
    }
  }

  /// Get weather icon URL
  static String getIconUrl(String iconCode) {
    return '${ApiConfig.iconBaseUrl}/$iconCode@2x.png';
  }
}