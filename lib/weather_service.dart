import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherAPI {
  final String apiKey = "4654b619b3e978310a5a04152ede039b"; // Replace with OpenWeatherMap API key

  Future<Map<String, dynamic>?> fetchWeather(String cityName) async {
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&units=metric&appid=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print('Error: Failed to fetch weather data. HTTP ${response.statusCode}');
      }
    } catch (e) {
      print('Exception: $e');
    }
    return null;
  }
}
