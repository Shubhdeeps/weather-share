import 'package:flutter/material.dart';
import '../utils.dart';

class StatsWeather extends StatelessWidget {
  const StatsWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 58,
      padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17),
        color: themeColor["secondaryFG"],
        // boxShadow: [BorderShadow()],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [],
      ),
    );
  }
}
