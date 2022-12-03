import 'package:flutter/material.dart';

import '../utils.dart';

class StatsContainer extends StatelessWidget {
  const StatsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 260,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(themeColor["primaryFG"]?.value ?? 0),
              Color(themeColor["secondaryFG"]?.value ?? 0),
            ],
          ),
          borderRadius: BorderRadius.circular(17),
          color: themeColor["primaryFG"],
          boxShadow: [BorderShadow()],
        ),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.red,
                child: Column(children: const [
                  Expanded(
                    flex: 2,
                    child: Text("Hello"),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text("Hello2"),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text("Hello3"),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text("Hello"),
                  ),
                ]),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.green,
              ),
            ),
          ],
        ));
  }
}

class MutedText extends StatelessWidget {
  const MutedText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("");
  }
}
