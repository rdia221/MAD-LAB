import 'dart:async';

/// Simulated API function
Future<String> fetchWeatherData() async {
  // Simulate network delay
  await Future.delayed(Duration(seconds: 3));

  // uncomment this line to simulate an error
  // throw Exception("Failed to fetch weather data!");

  return "Weather: Sunny, Temperature: 25°C";
}

void main() async {
  print("Fetching weather data...");

  try {
    String weather = await fetchWeatherData();
    print("Weather data received:");
    print(weather);
  } catch (e) {
    print("Error occurred while fetching weather data.");
    print("Details: $e");
  }

  print("Program finished.");
}
