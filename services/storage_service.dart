import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class StorageService {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// Favorites Management
  static Future<List<String>> getFavorites() async {
    final favorites = _prefs?.getStringList('favorites') ?? [];
    return favorites;
  }

  static Future<void> addFavorite(String city) async {
    final favorites = await getFavorites();
    if (!favorites.contains(city)) {
      favorites.add(city);
      await _prefs?.setStringList('favorites', favorites);
    }
  }

  static Future<void> removeFavorite(String city) async {
    final favorites = await getFavorites();
    favorites.remove(city);
    await _prefs?.setStringList('favorites', favorites);
  }

  static Future<bool> isFavorite(String city) async {
    final favorites = await getFavorites();
    return favorites.contains(city);
  }

  /// Settings Management
  static Future<bool> getTemperatureUnit() async {
    return _prefs?.getBool('isMetric') ?? true;
  }

  static Future<void> setTemperatureUnit(bool isMetric) async {
    await _prefs?.setBool('isMetric', isMetric);
  }

  /// Search History (Optional)
  static Future<List<String>> getSearchHistory() async {
    return _prefs?.getStringList('searchHistory') ?? [];
  }

  static Future<void> addToSearchHistory(String city) async {
    final history = await getSearchHistory();
    history.remove(city); // Remove if exists
    history.insert(0, city); // Add to beginning
    if (history.length > 10) history.removeLast(); // Keep only 10
    await _prefs?.setStringList('searchHistory', history);
  }
}