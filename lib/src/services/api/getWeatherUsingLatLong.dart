import 'dart:convert';

import 'package:http/http.dart' as http;

Future<dynamic> getWeatherUsingLatLong(double lat, double long) async {
  final res = await http.get(Uri.parse(
      'https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$long&current_weather=true'));
  return jsonDecode(res.body);
}

Future<dynamic> getWeatherForecaseUsingLatLong(double lat, double long) async {
  final userTimeZoneName = DateTime.now().timeZoneName;
  final res = await http.get(Uri.parse(
      'https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$long&daily=weathercode&daily=temperature_2m_max&daily=temperature_2m_min&timezone=$userTimeZoneName'));
  return jsonDecode(res.body);
}
