**# Flutter Weather Application**



**## 📱 Description**

**A multi-page Flutter mobile application that displays real-time weather data using the OpenWeatherMap Current Weather API. Users can search for cities, view detailed weather information, save favorite cities, and configure temperature units.**



**## ✨ Features**

**- 🔍 Search weather by city name**

**- 🌤️ Display detailed weather information (temperature, humidity, wind speed, etc.)**

**- ⭐ Save and manage favorite cities**

**- ⚙️ Settings for temperature units (°C/°F)**

**- 📍 Optional GPS location support**

**- 💾 Local storage for favorites**

**- 🎨 Clean and responsive UI**



**## 🛠️ Setup Instructions**



**### Prerequisites**

**- Flutter SDK (3.0 or higher)**

**- Dart SDK**

**- Android Studio / VS Code**

**- OpenWeatherMap API Key**



**### Installation Steps**



**1. \*\*Clone the repository\*\***

   **```bash**

   **git clone <your-repo-url>**

   **cd weather\_app**

   **```**



**2. \*\*Install dependencies\*\***

   **```bash**

   **flutter pub get**

   **```**



**3. \*\*Get your OpenWeatherMap API Key\*\***

   **- Go to \[OpenWeatherMap](https://openweathermap.org/api)**

   **- Sign up and get your free API key**



**4. \*\*Configure API Key\*\***

   **- Open `lib/config/api\_config.dart`**

   **- Replace `YOUR\_API\_KEY\_HERE` with your actual API key:**

   **```dart**

   **class ApiConfig {**

     **static const String apiKey = 'YOUR\_API\_KEY\_HERE';**

   **}**

   **```**



**5. \*\*Run the app\*\***

   **```bash**

   **flutter run**

   **```**



**## 📦 Building APK**



**To build an Android APK:**

**```bash**

**flutter build apk --release**

**```**



**The APK will be located at: `build/app/outputs/flutter-apk/app-release.apk`**



**## 🏗️ Project Structure**



**```**

**lib/**

**├── config/**

**│   └── api\_config.dart**

**├── models/**

**│   └── weather\_model.dart**

**├── pages/**

**│   ├── home\_page.dart**

**│   ├── weather\_details\_page.dart**

**│   ├── favorites\_page.dart**

**│   └── settings\_page.dart**

**├── services/**

**│   ├── api\_service.dart**

**│   └── storage\_service.dart**

**├── widgets/**

**│   ├── weather\_card.dart**

**│   └── loading\_indicator.dart**

**└── main.dart**

**```**



**## 🔑 API Usage**



**This app uses the OpenWeatherMap Current Weather Data API:**

**- Endpoint: `https://api.openweathermap.org/data/2.5/weather`**

**- Parameters: city name, API key, units (metric/imperial)**



