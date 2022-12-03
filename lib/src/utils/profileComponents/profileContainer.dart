import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      width: MediaQuery.of(context).size.width,
      height: 140,
      padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          color: Color(0xff2D143B),
          border: Border.all(
            width: 1,
            color: Color(0xffD1306B),
          )),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(children: <Widget>[
            SvgPicture.asset(
              'assets/images/pfpbg.svg',
              alignment: Alignment.topRight,
            ),
            CircleAvatar(
              backgroundImage: NetworkImage(imageURL),
              radius: 40,
            ),
          ]),
          SizedBox(width: 20),
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
              Stack(
                children: <Widget>[
                  SvgPicture.asset(
                    'assets/images/pfpbg.svg',
                    alignment: Alignment.topRight,
                    width: 36,
                    height: 36,
                  ),
                  Text(
                    "lives in $location",
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Color.fromARGB(255, 163, 163, 163),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
