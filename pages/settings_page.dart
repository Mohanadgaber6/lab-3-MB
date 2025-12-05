import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<SettingsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Temperature Unit Section
          Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Temperature Unit',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  RadioListTile<bool>(
                    title: const Text('Celsius (°C)'),
                    subtitle: const Text('Metric system'),
                    value: true,
                    groupValue: settings.isMetric,
                    onChanged: (value) {
                      if (value != null && value != settings.isMetric) {
                        settings.toggleUnit();
                      }
                    },
                  ),
                  RadioListTile<bool>(
                    title: const Text('Fahrenheit (°F)'),
                    subtitle: const Text('Imperial system'),
                    value: false,
                    groupValue: settings.isMetric,
                    onChanged: (value) {
                      if (value != null && value != settings.isMetric) {
                        settings.toggleUnit();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // About Section
          Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'About',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ListTile(
                    leading: const Icon(Icons.info_outline),
                    title: const Text('Version'),
                    trailing: const Text('1.0.0'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.cloud),
                    title: const Text('Data Source'),
                    trailing: const Text('OpenWeatherMap'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}