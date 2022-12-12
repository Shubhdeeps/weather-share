import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather_share/src/utils/imageCard/quoteCard.dart';
import '../utils/imageCard/imageCard.dart';
import 'models.dart';

class Post {
  final String uid;
  final String imageURL;
  final num temperature;
  final String location;
  final num weather_code;
  final Timestamp created;
  final num lat;
  final num lon;
  final String type;
  final User user;
  final bool isInsideUserProfile;
  Post(
    this.uid,
    this.imageURL,
    this.temperature,
    this.location,
    this.weather_code,
    this.created,
    this.lat,
    this.lon,
    this.type,
    this.user,
    this.isInsideUserProfile,
  );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "imageURL": imageURL,
        "temperature": temperature,
        "location": location,
        "weather_code": weather_code,
        "created": created,
        "lat": lat,
        "lon": lon,
        "type": type,
      };

  String timestampToString(Timestamp time) {
    final secondsCreatedAT = time.seconds;
    double timeNow = DateTime.now().millisecondsSinceEpoch / 1000;
    double seconds = timeNow - secondsCreatedAT;
    print(seconds);
    if (seconds < 60) {
      return "${seconds.round()} secs ago";
    } else if (seconds < 3600) {
      return "${(seconds / 60).round()} mins ago";
    } else if (seconds < 86400) {
      return "${(seconds / 3600).round()} hrs ago";
    } else if (seconds > 86400) {
      return "${(seconds / 86400).round()} days ago";
    }
    return "";
  }

  getPostContainer() {
    if (type == "POST") {
      return Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
        child: ImageCard(
          imageURL: imageURL,
          userName: user.username,
          userProfileURL: user.profileURL,
          timeOfPost: timestampToString(created),
          temprature: temperature,
          location: location,
          weatherCode: weather_code,
          isInsideUserProfile: isInsideUserProfile,
          authorUid: user.uid,
          lat: lat,
          long: lon,
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
        child: QuoteCard(
          quote: imageURL,
          userName: user.username,
          userProfileURL: user.profileURL,
          timeOfPost: timestampToString(created),
          temprature: temperature,
          location: location,
          weatherCode: weather_code,
          isInsideUserProfile: isInsideUserProfile,
          authorUid: user.uid,
          lat: lat,
          long: lon,
        ),
      );
    }
  }
}
