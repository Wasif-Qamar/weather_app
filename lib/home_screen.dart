import 'package:flutter/material.dart';
import 'weather_service.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final WeatherAPI weatherAPI = WeatherAPI();
  String cityName = "London"; // Default city name
  Map<String, dynamic>? weatherData;

  void fetchWeatherData() async {
    final data = await weatherAPI.fetchWeather(cityName);
    setState(() {
      weatherData = data;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchWeatherData(); // Fetch weather on widget initialization
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: weatherData == null
          ? const Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'City: ${weatherData?['name'] ?? 'Unknown'}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'Temperature: ${weatherData?['main']?['temp'] ?? 'N/A'}°C',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Weather: ${weatherData?['weather']?[0]?['description'] ?? 'N/A'}',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
