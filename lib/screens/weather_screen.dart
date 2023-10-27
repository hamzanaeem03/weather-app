import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_services.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    final _weatherService = WeatherService('2b087f075a96b61d3ecf124ec9489e3e');
    Weather? _weather;

    _fetchWeather() async {
      String cityName = await _weatherService.getCurrentCity();

      try {
        final weather = await _weatherService.getWeather(cityName);
        setState(() {
          _weather = weather;
        });
      } catch (e) {
        print(e);
      }
    }

    // String getWeatherAnimation(String mainCondition) {
    //   if (mainCondition == null) return 'assets/sunny.json';
    //   switch (mainCondition.toLowerCase()){
    //     case 'clear':
    //             return 'assets/sunny.json';
    //     case 'clouds':
    //     case 'dust':
    //     case 'mist':
    //     case 'smoke':
    //     case 'haze':
    //     case 'fog':
    //     return 'assets/cloud.json';
    //     case 'rain':
    //     case 'drizzle':
    //     case 'shower rain':
    //             return 'assets/rain.json';
    //     case 'thumderstorm':
    //             return 'assets/thunder.json';
    //             default :
    //             return 'assets/sunny.json';
    //   }
    // }
@override
    void initState() {
      super.initState();
      _fetchWeather();
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(_weather?.cityName ?? 'loading data'),
            Text('${_weather?.temprature.round()}C'),
          ],
        ),
      ),
    );
  }
}
