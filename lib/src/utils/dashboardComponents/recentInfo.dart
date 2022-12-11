import 'package:flutter/material.dart';
import 'package:weather_share/src/utils/modals/weatherForcastModal.dart';

import '../utils.dart';

class RecentInfo extends StatelessWidget {
  const RecentInfo({super.key});
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
            const Text(
              "Recent",
              style: TextStyle(color: Colors.white60, fontSize: 18),
            ),
            IconButton(
              onPressed: () {
                weatherForecaseModal(context);
              },
              icon: const IconTheme(
                data: IconThemeData(color: Colors.white60),
                child: Icon(Icons.cloud),
              ),
            )
          ],
        ),
      ),
    );
  }
}
