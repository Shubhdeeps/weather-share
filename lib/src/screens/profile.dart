import 'package:flutter/material.dart';
import 'package:weather_share/src/utils/utils.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int tab = 0;

  void tabChange(int num) {
    setState(() {
      tab = num;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: ProfileContainer(
              imageURL:
                  'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
              location: "Tallinn",
              name: "John"),
        ),
        Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: NavContainer(tabChange, tab)),
        const SizedBox(height: 20),
        ProfileView(tab),
      ]),
    );
  }
}
