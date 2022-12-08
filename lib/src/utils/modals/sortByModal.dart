import 'dart:ffi';

import 'package:flutter/material.dart';

import '../utils.dart';

void sortByModal(context, selectWeatherType, weatherType) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (BuildContext context) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: 300,
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
              topRight: Radius.circular(30)),
          color: themeColor["secondaryFG"],
          boxShadow: [BorderShadow()],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "Sort by weather",
              style: TextStyle(fontSize: 18, color: Colors.white54),
            ),
            SortWeatherRow(
              "All",
              0,
              weatherType,
              selectWeatherType,
            ),
            SortWeatherRow(
              "Sunny",
              1,
              weatherType,
              selectWeatherType,
            ),
            SortWeatherRow(
              "Cloudy",
              2,
              weatherType,
              selectWeatherType,
            ),
            SortWeatherRow(
              "Snowy",
              3,
              weatherType,
              selectWeatherType,
            ),
            SortWeatherRow(
              "Clear",
              5,
              weatherType,
              selectWeatherType,
            ),
            SortWeatherRow(
              "Rainy",
              4,
              weatherType,
              selectWeatherType,
            ),
          ],
        ),
      );
    },
  );
}

class SortWeatherRow extends StatelessWidget {
  String name;
  int currentWeatherNum;
  int weatherType;
  Function selectWeatherType;
  SortWeatherRow(this.name, this.currentWeatherNum, this.weatherType,
      this.selectWeatherType,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        selectWeatherType(currentWeatherNum);
        // to close the modal
        Navigator.pop(context);
      },
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          name,
          style: TextStyle(
              fontSize: 28,
              color: weatherType == currentWeatherNum
                  ? Colors.white
                  : Colors.white60),
        ),
        IconTheme(
          data: IconThemeData(
              color: weatherType == currentWeatherNum
                  ? Colors.green[400]
                  : Colors.transparent),
          child: Icon(Icons.check),
        ),
      ]),
    );
  }
}
