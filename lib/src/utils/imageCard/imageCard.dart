import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../screens/otherUsersProfile.dart';
import '../../services/logical/weatherCodeToIcon.dart';
import '../utils.dart';

class ImageCard extends StatelessWidget {
  final String imageURL;
  final String userName;
  final String userProfileURL;
  final int timeOfPost;
  final int temprature;
  final String location;
  final String weather;
  final bool isInsideUserProfile;
  const ImageCard({
    super.key,
    required this.imageURL,
    required this.userName,
    required this.userProfileURL,
    required this.timeOfPost,
    required this.temprature,
    required this.location,
    required this.weather,
    required this.isInsideUserProfile,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          left: -20,
          child: Container(
              alignment: Alignment.topLeft,
              width: 250,
              height: 250,
              child: Image.asset('assets/images/blur2.png')),
        ),
        Positioned(
          right: -140,
          top: 70,
          child: Container(
              alignment: Alignment.topLeft,
              width: 250,
              height: 250,
              child: Image.asset('assets/images/blur2.png')),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: SizedBox(
            height: 300,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: themeColor["secondaryFG"],
                borderRadius: BorderRadius.circular(30),
                boxShadow: [BorderShadow()],
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                          topRight: Radius.circular(30)),
                      child: SizedBox.fromSize(
                        size:
                            Size.fromRadius(MediaQuery.of(context).size.width),
                        child: Image.network(
                          imageURL,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: GestureDetector(
                                onTap: () {
                                  if (isInsideUserProfile == false) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const OtherUserProfile()),
                                    );
                                  }
                                  ;
                                },
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(userProfileURL
                                          .isEmpty
                                      ? "https://cdn.pixabay.com/photo/2016/09/28/02/14/user-1699635_960_720.png"
                                      : userProfileURL),
                                  radius: 30,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              flex: 2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    userName,
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "$timeOfPost mins ago",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w100,
                                      color: Colors.white30,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(width: 50),
                            const Expanded(
                              flex: 3,
                              child: WeatherInfo(),
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "-8°C",
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            Text(
              "Tallinn",
              style: TextStyle(color: Colors.white60, fontSize: 18),
            )
          ],
        ),
        SvgPicture.asset(
          weatherCodes[2]!,
          height: 38,
        )
      ],
    );
  }
}
