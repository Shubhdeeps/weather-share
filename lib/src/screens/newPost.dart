import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_share/src/utils/newpostComponent/newPostContents.dart';

class Newpost extends StatelessWidget {
  Position currentUserPosition;
  Newpost({super.key, required this.currentUserPosition});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: NewPostContents(currentUserPosition: currentUserPosition),
    );
  }
}
