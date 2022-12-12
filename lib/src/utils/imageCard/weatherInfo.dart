import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_share/src/utils/modals/weatherForcastModal.dart';

import '../../services/logical/weatherCodeToIcon.dart';

class WeatherInfo extends StatelessWidget {
  final num weather_code;
  final num temperature;
  final String city;
  final num lat;
  final num lon;
  WeatherInfo(this.weather_code, this.temperature, this.city,
      {super.key, required this.lat, required this.lon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        weatherForecaseModal(context, 59.44, 24.65, city);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$temperature °C",
                style: const TextStyle(color: Colors.white, fontSize: 22),
              ),
              Text(
                city,
                style: const TextStyle(color: Colors.white60, fontSize: 18),
              )
            ],
          ),
          SvgPicture.asset(
            weatherCodes[weather_code]!,
            height: 38,
          )
        ],
      ),
    );
  }
}
