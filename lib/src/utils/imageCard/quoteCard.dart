import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather_share/src/utils/imageCard/weatherInfo.dart';
import '../../screens/otherUsersProfile.dart';
import '../utils.dart';

class QuoteCard extends StatelessWidget {
  final String quote;
  final String userName;
  final String userProfileURL;
  final String timeOfPost;
  final num temprature;
  final String location;
  final num weatherCode;
  final bool isInsideUserProfile;
  final String authorUid;
  final num lat;
  final num long;
  const QuoteCard({
    super.key,
    required this.quote,
    required this.userName,
    required this.userProfileURL,
    required this.timeOfPost,
    required this.temprature,
    required this.location,
    required this.weatherCode,
    required this.isInsideUserProfile,
    required this.authorUid,
    required this.lat,
    required this.long,
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
                      child: Container(
                        color: const Color(0xffEAE5E4),
                        child: SizedBox.fromSize(
                          size: Size.fromRadius(
                            MediaQuery.of(context).size.width,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Padding(
                                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                      child: Icon(Icons.format_quote)),
                                  Text(
                                    quote.split("-")[0],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 25,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Text(
                                      "-${quote.split("-").last}",
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w100),
                                    ),
                                  ),
                                ]),
                          ),
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
                                              OtherUserProfile(
                                                uid: authorUid,
                                              )),
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
                                    timeOfPost,
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
                            Expanded(
                              flex: 3,
                              child: WeatherInfo(
                                weatherCode,
                                temprature,
                                location,
                                lat: lat,
                                lon: long,
                              ),
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
