import 'package:flutter/material.dart';
import 'package:weather_share/src/models/models.dart';

import '../utils.dart';

void userProfileModal(context, User user) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (BuildContext context) {
      return Stack(children: [
        Container(
          margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
                topRight: Radius.circular(30)),
            color: themeColor["secondaryFG"],
            boxShadow: [BorderShadow()],
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.95,
          child: const Text("hello"),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              // color: themeColor["secondaryFG"]
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(themeColor["active"]?.value ?? 0),
                  Color(themeColor["active2"]?.value ?? 0),
                ],
              ),
            ),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                user.profileURL.isEmpty
                    ? "https://cdn.pixabay.com/photo/2016/09/28/02/14/user-1699635_960_720.png"
                    : user.profileURL,
              ),
              radius: 50,
            ),
          ),
        ]),
      ]);
    },
  );
}
