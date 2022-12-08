import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import '../utils/utils.dart';

class Feed extends StatelessWidget {
  Function selectWeatherType;
  int weatherType;
  Feed(this.selectWeatherType, this.weatherType, {super.key});

  Future<void> _refresh() async {
    return await Future.delayed(Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
      backgroundColor: themeColor["primaryBG"],
      color: themeColor["active"],
      showChildOpacityTransition: true,
      springAnimationDurationInMilliseconds: 50,
      onRefresh: _refresh,
      child: ListView(
        children: [
          Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: RecentInfo(selectWeatherType, weatherType)),
          const SizedBox(
            height: 20,
          ),
          const ImageCard(
            imageURL:
                "https://images.thestar.com/oIUsFcBXHzfQ76hLq2wQgy2CIjg=/1086x724/smart/filters:cb(1642441832357):format(webp)/https://www.thestar.com/content/dam/thestar/news/gta/2022/01/17/ontario-its-a-snow-day-as-schools-close-social-media-lights-up-with-kids-playing-in-snow/kidssnow.jpg",
            userName: "john",
            userProfileURL:
                "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80",
            timeOfPost: 13,
            temprature: -5,
            location: "Helsinki",
            weather: "Snowy",
          ),
          const SizedBox(
            height: 20,
          ),
          const ImageCard(
            imageURL:
                "https://images.thestar.com/oIUsFcBXHzfQ76hLq2wQgy2CIjg=/1086x724/smart/filters:cb(1642441832357):format(webp)/https://www.thestar.com/content/dam/thestar/news/gta/2022/01/17/ontario-its-a-snow-day-as-schools-close-social-media-lights-up-with-kids-playing-in-snow/kidssnow.jpg",
            userName: "john",
            userProfileURL:
                "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80",
            timeOfPost: 13,
            temprature: -5,
            location: "Helsinki",
            weather: "Snowy",
          ),
          const SizedBox(
            height: 20,
          ),
          const ImageCard(
            imageURL:
                "https://images.thestar.com/oIUsFcBXHzfQ76hLq2wQgy2CIjg=/1086x724/smart/filters:cb(1642441832357):format(webp)/https://www.thestar.com/content/dam/thestar/news/gta/2022/01/17/ontario-its-a-snow-day-as-schools-close-social-media-lights-up-with-kids-playing-in-snow/kidssnow.jpg",
            userName: "john",
            userProfileURL:
                "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80",
            timeOfPost: 13,
            temprature: -5,
            location: "Helsinki",
            weather: "Snowy",
          ),
          const SizedBox(
            height: 20,
          ),
          const ImageCard(
            imageURL:
                "https://images.thestar.com/oIUsFcBXHzfQ76hLq2wQgy2CIjg=/1086x724/smart/filters:cb(1642441832357):format(webp)/https://www.thestar.com/content/dam/thestar/news/gta/2022/01/17/ontario-its-a-snow-day-as-schools-close-social-media-lights-up-with-kids-playing-in-snow/kidssnow.jpg",
            userName: "john",
            userProfileURL:
                "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80",
            timeOfPost: 13,
            temprature: -5,
            location: "Helsinki",
            weather: "Snowy",
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
