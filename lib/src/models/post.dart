import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import '../utils/imageCard/imageCard.dart';
import 'models.dart';

class Post {
  final String uid;
  final String imageURL;
  final int temperature;
  final String location;
  final int weather_code;
  final Timestamp created;
  final double lat;
  final double lon;
  final String type;
  final User user;
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

  // setUser(User user) {
  //   this.user = user;
  // }

  getPostContainer() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
      child: ImageCard(
        imageURL: imageURL,
        userName: user.username,
        userProfileURL: user.profileURL,
        timeOfPost: 13,
        temprature: temperature,
        location: location,
        weather: "Snowy",
        isInsideUserProfile: false,
      ),
    );
  }

  // static Post fromJson(Map<String, dynamic> json) => Post(
  //       json["uid"],
  //       json["imageURL"],
  //       json["temperature"],
  //       json["location"],
  //       json["weather_code"],
  //       json["created"],
  //       json["lat"],
  //       json["lon"],
  //       json["type"],
  //     );
}
