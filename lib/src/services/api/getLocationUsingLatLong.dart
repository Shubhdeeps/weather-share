import 'dart:convert';

import 'package:http/http.dart' as http;

Future<dynamic> getUserLocationUsingLatLong(double lat, double long) async {
  final res = await http
      .get(Uri.parse('https://geocode.maps.co/reverse?lat=$lat&lon=$long'));
  return jsonDecode(res.body);
}
