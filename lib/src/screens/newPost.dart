import 'package:flutter/material.dart';
import 'package:weather_share/src/utils/newpostComponent/newPostContents.dart';

class Newpost extends StatelessWidget {
  const Newpost({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: NewPostContents(),
    );
  }
}
