import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_share/src/services/api/getWeatherUsingLatLong.dart';

import '../../services/logical/weatherCodeToIcon.dart';
import '../utils.dart';

Future<void> weatherForecaseModal(context, lat, long, city) async {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (BuildContext context) {
      return Container(
        margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
              topRight: Radius.circular(30)),
          color: themeColor["secondaryFG"],
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 3,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 10, 20, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Weather forecast in $city",
                style: TextStyle(fontSize: 18, color: Colors.white54),
              ),
              FutureBuilder(
                future: getWeatherForecaseUsingLatLong(lat, long),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.hasData) {
                    final List<dynamic> days = snapshot.data["daily"]["time"];
                    final List weatherCodes =
                        snapshot.data["daily"]["weathercode"];
                    final List maxTemp =
                        snapshot.data["daily"]["temperature_2m_max"];
                    final List minTemp =
                        snapshot.data["daily"]["temperature_2m_min"];
                    return Expanded(
                      child: ListView(
                        children: <Widget>[
                          for (int i = 0; i < days.length; i++)
                            ForecastRow(
                              day: days[i],
                              maxTemp: maxTemp[i],
                              minTemp: minTemp[i],
                              weatherCode: weatherCodes[i],
                            ),
                        ],
                      ),
                    );
                  }
                  if (snapshot.hasError) {
                    return const Text(
                      "Something went wrong, please try again later.",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 29,
                      ),
                    );
                  }
                  return const CircularProgressIndicator();
                },
              )
            ],
          ),
        ),
      );
    },
  );
}

class ForecastRow extends StatelessWidget {
  final String day;
  final num minTemp;
  final num maxTemp;
  final int weatherCode;
  const ForecastRow(
      {super.key,
      required this.day,
      required this.minTemp,
      required this.maxTemp,
      required this.weatherCode});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            day.toString(),
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
          Text(
            "${maxTemp.round()}°C/${minTemp.round()}°C",
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
          SvgPicture.asset(
            weatherCodes[weatherCode]!,
            height: 38,
          )
        ],
      ),
    );
  }
}
