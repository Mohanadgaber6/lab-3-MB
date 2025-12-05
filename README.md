Flutter Weather Application 🌤️
A beautiful and functional multi-page Flutter mobile application that displays real-time weather data using the OpenWeatherMap Current Weather API.
📱 About The App
This weather application allows users to search for any city worldwide and view detailed weather information including temperature, humidity, wind speed, sunrise/sunset times, and more. Users can save their favorite cities for quick access and customize temperature units.
✨ Features

🔍 City Search - Search weather by city name with real-time API integration
🌡️ Detailed Weather Info - View temperature, feels like, humidity, wind speed, sunrise/sunset times
🖼️ Weather Icons - Dynamic weather icons from OpenWeatherMap
⏰ Local Time - Display local time using timezone offset
⭐ Favorites - Save and manage favorite cities with persistent storage
⚙️ Settings - Toggle between Celsius (°C) and Fahrenheit (°F)
📱 Responsive UI - Clean, modern interface with smooth navigation
❌ Error Handling - Comprehensive error handling for network issues, invalid cities, and API errors
💾 Local Storage - Favorites persist across app sessions
🔄 State Management - Efficient state management using Provider

📸 Screenshots
(Add your screenshots here after running the app)
Show Image
Show Image
Show Image
Show Image
🛠️ Technologies Used

Flutter - UI framework
Dart - Programming language
Provider - State management
HTTP - API requests
SharedPreferences - Local data storage
OpenWeatherMap API - Weather data source

📋 Prerequisites
Before you begin, ensure you have the following installed:

Flutter SDK (3.0 or higher) - Install Flutter
Dart SDK (included with Flutter)
Android Studio / VS Code with Flutter extensions
Android Emulator or physical device for testing
OpenWeatherMap API Key (free) - Get API Key

🚀 Installation & Setup
Step 1: Clone the Repository
bashgit clone https://github.com/yourusername/weather_app.git
cd weather_app
Step 2: Install Dependencies
bashflutter pub get
Step 3: Get Your API Key

Visit OpenWeatherMap
Sign up for a free account
Navigate to "API keys" in your account
Copy your API key

Step 4: Configure API Key
Open the file lib/config/api_config.dart and replace YOUR_API_KEY_HERE with your actual API key:
dartclass ApiConfig {
  static const String apiKey = 'YOUR_ACTUAL_API_KEY_HERE';
  // ... rest of the code
}
⚠️ IMPORTANT: Never commit your API key to public repositories. Add api_config.dart to your .gitignore file.
Step 5: Run the App
bashflutter run
📦 Building APK
To build a release APK for Android:
bashflutter build apk --release
The APK will be located at:
build/app/outputs/flutter-apk/app-release.apk
To build a split APK (smaller file size):
bashflutter build apk --split-per-abi
🏗️ Project Structure
weather_app/
├── lib/
│   ├── config/
│   │   └── api_config.dart          # API configuration
│   ├── models/
│   │   └── weather_model.dart       # Weather data model
│   ├── pages/
│   │   ├── home_page.dart           # Home/Search screen
│   │   ├── weather_details_page.dart # Weather details screen
│   │   ├── favorites_page.dart      # Favorites screen
│   │   └── settings_page.dart       # Settings screen
│   ├── services/
│   │   ├── api_service.dart         # API calls handling
│   │   └── storage_service.dart     # Local storage management
│   ├── widgets/
│   │   ├── weather_card.dart        # Reusable weather card
│   │   └── loading_indicator.dart   # Loading indicators
│   └── main.dart                    # App entry point
├── pubspec.yaml                     # Dependencies
├── README.md                        # This file
└── .gitignore                       # Git ignore rules
🔑 API Usage
This app uses the OpenWeatherMap Current Weather Data API:
Endpoint: https://api.openweathermap.org/data/2.5/weather
Parameters:

q - City name
appid - Your API key
units - metric (Celsius) or imperial (Fahrenheit)

Example Request:
https://api.openweathermap.org/data/2.5/weather?q=London&appid=YOUR_API_KEY&units=metric
Rate Limits (Free Tier):

60 calls/minute
1,000,000 calls/month

📱 App Screens
1. Home Screen

Search bar for city input
Quick access to favorites and settings
Search history (optional feature)

2. Weather Details Screen

City name
Current temperature
Weather description
"Feels like" temperature
Humidity percentage
Wind speed
Sunrise time
Sunset time
Weather icon
Local time
Add/Remove from favorites button

3. Favorites Screen

List of saved favorite cities
Tap to view weather details
Swipe to delete from favorites

4. Settings Screen

Temperature unit toggle (Celsius/Fahrenheit)
App version information
About section

🧪 Testing
Run tests using:
bashflutter test
🐛 Troubleshooting
Common Issues:
1. API Key Error (401)

Make sure you've added your API key correctly in api_config.dart
Wait 10-15 minutes after generating a new API key for it to activate

2. City Not Found (404)

Check spelling of city name
Try searching with country code: "London,UK"

3. No Internet Connection

Check your device's internet connection
Try again when connection is restored

4. Build Errors

Run flutter clean and then flutter pub get
Make sure Flutter SDK is up to date: flutter upgrade

🔒 Security Notes

Never commit your API key to version control
Add lib/config/api_config.dart to .gitignore
Use environment variables for production apps
Consider using Flutter's --dart-define for API keys in CI/CD

📄 Dependencies
yamldependencies:
  flutter:
    sdk: flutter
  provider: ^6.1.1              # State management
  http: ^1.1.0                  # HTTP requests
  shared_preferences: ^2.2.2    # Local storage
  cupertino_icons: ^1.0.2       # iOS style icons
🤝 Contributing
Contributions are welcome! Please feel free to submit a Pull Request.

Fork the project
Create your feature branch (git checkout -b feature/AmazingFeature)
Commit your changes (git commit -m 'Add some AmazingFeature')
Push to the branch (git push origin feature/AmazingFeature)
Open a Pull Request

📝 Assignment Requirements Checklist

✅ Multi-page Flutter application (4 screens)
✅ OpenWeatherMap Current Weather API integration
✅ Search weather by city name
✅ Display all required weather information
✅ Weather icons from API
✅ Local time using timezone offset
✅ Save/manage favorite cities
✅ Settings screen with temperature unit toggle
✅ Proper error handling (no internet, invalid city, API errors)
✅ State management (Provider)
✅ Local storage (SharedPreferences)
✅ Clean, organized folder structure
✅ Loading indicators
✅ Responsive UI design
✅ Code comments and documentation

🎥 Demo Video
[Link to demo video showing all features]
The demo video demonstrates:

✅ Searching for a city
✅ Displaying weather details
✅ Adding cities to favorites
✅ Viewing favorites list
✅ Changing temperature units (°C/°F)
✅ Real-time API calls working

📧 Contact
Your Name - your.email@example.com
Project Link: https://github.com/yourusername/weather_app
📄 License
This project is licensed under the MIT License - see the LICENSE file for details.
🙏 Acknowledgments

OpenWeatherMap - Weather data API
Flutter - UI framework
Material Design - Design guidelines
