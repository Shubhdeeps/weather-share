import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_share/src/utils/styles/color.dart';

class ProfileContainer extends StatelessWidget {
  final String imageURL;
  final String name;
  final String location;
  const ProfileContainer(
      {super.key,
      required this.imageURL,
      required this.name,
      required this.location});

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
        height: 100,
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
        decoration: BoxDecoration(
          color: themeColor["primaryBG"],
          borderRadius: BorderRadius.circular(17),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(imageURL),
              radius: 40,
            ),
            const SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 32,
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
                Text(
                  "lives in $location",
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Color.fromARGB(255, 163, 163, 163),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
