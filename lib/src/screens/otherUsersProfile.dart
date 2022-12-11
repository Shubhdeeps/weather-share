import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/utils.dart';

class OtherUserProfile extends StatelessWidget {
  const OtherUserProfile({super.key});

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
        color: themeColor["primaryBG"],
        child: SingleChildScrollView(
          child: Column(children: const [
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: ProfileContainer(
                  imageURL:
                      'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
                  location: "Tallinn",
                  name: "John"),
            ),
            SizedBox(height: 20),
            SizedBox(height: 20),
          ]),
        ),
      ),
    );
  }
}
