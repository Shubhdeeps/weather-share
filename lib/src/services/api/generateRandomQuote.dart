import 'dart:convert';

import 'package:http/http.dart' as http;

Future<dynamic> generateRandomQuote() async {
  final res = await http.get(Uri.parse('https://api.api-ninjas.com/v1/quotes'),
      headers: {"X-Api-Key": "zZC8PbO9B6Dpv8QO8zD+Gw==EMYeGqVwm4xUGVs3"});
  return jsonDecode(res.body)[0];
}
