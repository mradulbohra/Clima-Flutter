import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';
import 'package:clima/utilities/constants.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';
class WeatherModel {

  Future getCityWeather(var cityName) async
  {
   String url = 'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$kAPIkey&units=metric';
   NetworkUtil networkUtil = new NetworkUtil(url: url);
   //  networkUtil.getData();
   var weatherData = await networkUtil.getData();
   return weatherData;

  }

  Future<dynamic> getLocationWeather() async
{

  Location location = new Location();
  await location.getCurrentLocation();
//    latitude = location.latitude;
  //  longitude = location.longitude;
  String url = 'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$kAPIkey&units=metric';
  NetworkUtil networkUtil = new NetworkUtil(url: url);
  //  networkUtil.getData();
  var weatherData = await networkUtil.getData();
  return weatherData;

}
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
