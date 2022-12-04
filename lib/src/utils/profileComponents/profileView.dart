import 'package:flutter/material.dart';

import '../utils.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [StatsContainer(), SizedBox(height: 20), StatsWeather()],
      ),
    );
  }
}
