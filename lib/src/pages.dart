import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_share/src/utils/utils.dart';

import 'screens/screens.dart';
import 'services/logical/getDeviceGeoLocation.dart';

class Pages extends StatefulWidget {
  Function pageValue;
  PageController pageController;
  Pages(this.pageValue, this.pageController, {super.key});

  @override
  State<Pages> createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  Future<Position> currentUserPosition() async {
    final location = await getCurrentLocation();
    return location;
  }

  AlertDialog showAlert(String err) {
    return AlertDialog(
      title: Text(
        err,
        style: const TextStyle(color: Colors.white),
      ),
      content: const Text(
        "Unable to get device location, please turn on location adn try again.",
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
              Profile()
            ],
          );
        } else if (snapshot.hasError) {
          showDialog(
            context: context,
            builder: (_) => showAlert(snapshot.error.toString()),
            barrierDismissible: false,
          );
          return Center(
            child: Text(snapshot.error.toString()),
          );
        } else {
          return Column(children: const [
            SizedBox(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text('Awaiting result...'),
            ),
          ]);
        }
      },
    );
  }
}
