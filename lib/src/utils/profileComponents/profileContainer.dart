import 'package:flutter/material.dart';
import 'package:weather_share/src/services/firebaseConfig.dart';
import '../../models/models.dart';
import '../utils.dart';

class ProfileContainer extends StatelessWidget {
  final User user;
  const ProfileContainer({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(themeColor["active"]?.value ?? 0),
            Color(themeColor["active2"]?.value ?? 0),
          ],
        ),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
        decoration: BoxDecoration(
          color: themeColor["primaryBG"],
          borderRadius: BorderRadius.circular(17),
        ),
        child: Column(children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(user.profileURL.isEmpty
                    ? "https://cdn.pixabay.com/photo/2016/09/28/02/14/user-1699635_960_720.png"
                    : user.profileURL),
                radius: 40,
              ),
              const SizedBox(width: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.username,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 32,
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
                  Text(
                    "lives in ${user.location}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Color.fromARGB(255, 163, 163, 163),
                    ),
                  )
                ],
              ),
              if (user.uid == auth.currentUser?.uid)
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          userProfileModal(context, user);
                        },
                        icon: const IconTheme(
                          data: IconThemeData(color: Colors.white60),
                          child: Icon(Icons.more_vert),
                        ),
                      )
                    ],
                  ),
                )
            ],
          ),
        ]),
      ),
    );
  }
}
