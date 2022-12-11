import 'package:flutter/material.dart';

import '../utils.dart';

class ProfileView extends StatelessWidget {
  final int tab;
  const ProfileView(this.tab, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: (() {
      if (tab == 1) {
        return Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Column(
            children: const [
              StatsContainer(),
              SizedBox(height: 20),
              StatsWeather()
            ],
          ),
        );
      } else {
        return Container(
          child: Column(
            children: const [
              SizedBox(
                height: 20,
              ),
              // ImageCard(
              //   imageURL:
              //       "https://images.thestar.com/oIUsFcBXHzfQ76hLq2wQgy2CIjg=/1086x724/smart/filters:cb(1642441832357):format(webp)/https://www.thestar.com/content/dam/thestar/news/gta/2022/01/17/ontario-its-a-snow-day-as-schools-close-social-media-lights-up-with-kids-playing-in-snow/kidssnow.jpg",
              //   userName: "john",
              //   userProfileURL:
              //       "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80",
              //   timeOfPost: 13,
              //   temprature: -5,
              //   location: "Helsinki",
              //   weatherCode: 95,
              //   isInsideUserProfile: true,
              // ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        );
      }
    }()));
  }
}
