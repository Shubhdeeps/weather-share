import 'package:flutter/material.dart';

import '../utils.dart';

class ProfileAppbar extends StatelessWidget {
  const ProfileAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(height: 50),
        ProfileContainer(
            imageURL:
                'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
            location: "Tallinn",
            name: "John"),
        SizedBox(height: 0),
        NavContainer(),
      ],
    );
  }
}
