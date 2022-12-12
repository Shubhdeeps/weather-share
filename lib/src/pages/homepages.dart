import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_share/src/utils/utils.dart';

import '../screens/screens.dart';
import '../services/logical/getDeviceGeoLocation.dart';

class HomePage extends StatefulWidget {
  Function pageValue;
  PageController pageController;
  HomePage(this.pageValue, this.pageController, {super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  Future<Position> currentUserPosition() async {
    try {
      final location = await getCurrentLocation();
      return location;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  AlertDialog showAlert(String err) {
    return AlertDialog(
      title: Text(
        err,
        style: const TextStyle(color: Colors.white),
      ),
      content: const Text(
        "Unable to get device location, please turn on location and try again.",
        style: TextStyle(color: Colors.white),
      ),
      actions: [
        TextButton(
            onPressed: () {
              SystemNavigator.pop();
            },
            child: const Text("Close application")),
      ],
      elevation: 24,
      backgroundColor: themeColor["secondaryFG"],
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: currentUserPosition(),
      builder: (BuildContext context, AsyncSnapshot<Position> snapshot) {
        if (snapshot.hasData) {
          return PageView(
            controller: widget.pageController,
            onPageChanged: (value) => widget.pageValue(value),
            children: <Widget>[
              Feed(currentUserPosition: snapshot.data!, null),
              Newpost(currentUserPosition: snapshot.data!),
              Profile(uid: "tester-author")
            ],
          );
        } else if (snapshot.hasError) {
          Future.delayed(Duration.zero, () {
            showDialog(
              context: context,
              builder: (_) => showAlert(snapshot.error.toString()),
              barrierDismissible: false,
            );
          });
          return Center(
            child: Text(snapshot.error.toString()),
          );
        } else {
          return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                    'Fetching location...',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ]);
        }
      },
    );
  }
}
