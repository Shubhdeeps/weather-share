import 'package:flutter/material.dart';

import '../utils.dart';

class RecentInfo extends StatelessWidget {
  Function selectWeatherType;
  int weatherType;
  RecentInfo(this.selectWeatherType, this.weatherType, {super.key});

  Map<int, String> weatherMap = {
    0: "Recent",
    1: "Sunny",
    2: "Cloudy",
    3: "Snowy",
    4: "Rainy",
    5: "Clear",
  };
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(themeColor["active"]?.value ?? 0),
            Color(themeColor["active2"]?.value ?? 0),
          ],
        ),
      ),
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          color: themeColor["primaryBG"],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              weatherMap[weatherType]!,
              style: TextStyle(color: Colors.white60, fontSize: 18),
            ),
            IconButton(
              onPressed: () {
                sortByModal(context, selectWeatherType, weatherType);
              },
              icon: const IconTheme(
                data: IconThemeData(color: Colors.white60),
                child: Icon(Icons.more_vert),
              ),
            )
          ],
        ),
      ),
    );
  }
}
