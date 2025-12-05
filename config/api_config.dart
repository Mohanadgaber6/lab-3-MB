class ApiConfig {
  // 🔑 حط مفتاح الـ API الحقيقي هنا
  // مثال: "bb1ff7c2f20d0a252d19200f230eee7b"
  static const String apiKey = 'bb1ff7c2f20d0a252d19200f230eee7b';

  static const String baseUrl = 'https://api.openweathermap.org/data/2.5';
  static const String iconBaseUrl = 'https://openweathermap.org/img/wn';

  // يتأكد إن المفتاح متحطّش فاضي
  static bool get isConfigured => apiKey.isNotEmpty && apiKey.length > 20;
}
