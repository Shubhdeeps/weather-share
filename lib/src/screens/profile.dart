import 'package:flutter/material.dart';
import 'package:weather_share/src/utils/utils.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(30),
        child: Column(children: const [
          SizedBox(height: 50),
          ProfileContainer(
              imageURL:
                  'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
              location: "Tallinn",
              name: "John"),
          SizedBox(height: 50),
          NavContainer(),
          SizedBox(height: 20),
          StatsContainer(),
          SizedBox(height: 20),
          StatsWeather()
        ]),
      ),
    );
  }
}
