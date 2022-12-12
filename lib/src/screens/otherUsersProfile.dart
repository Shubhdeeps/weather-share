import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_share/src/screens/profile.dart';

import '../utils/utils.dart';

class OtherUserProfile extends StatelessWidget {
  final String uid;
  const OtherUserProfile({super.key, required this.uid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: themeColor["primaryBG"],
        ),
        toolbarHeight: 80,
        flexibleSpace: Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          color: themeColor["primaryBG"],
        ),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: [
                Color(themeColor["primaryBG"]?.value ?? 0),
                Color(themeColor["secondaryBG"]?.value ?? 0),
              ],
            ),
          ),
          child: Profile(
            uid: uid,
          )),
    );
  }
}
