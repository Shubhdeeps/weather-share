import 'package:flutter/material.dart';
import 'package:weather_share/src/models/models.dart';
import 'package:weather_share/src/services/cloud/getUserProfileBasedOnUid.dart';
import 'package:weather_share/src/utils/utils.dart';

class Profile extends StatefulWidget {
  final String uid;
  const Profile({super.key, required this.uid});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Future<User> getData() async {
    final user = await getUserBasedOnGivenUid(widget.uid);
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ProfileView(
            user: snapshot.data!,
            child: ProfileContainer(
              user: snapshot.data!,
            ),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
