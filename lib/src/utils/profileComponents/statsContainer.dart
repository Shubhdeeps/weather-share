import 'package:flutter/material.dart';

import '../utils.dart';

class StatsContainer extends StatelessWidget {
  const StatsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 260,
        padding: const EdgeInsets.all(20),
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
                padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: const [
                      Expanded(
                        flex: 2,
                        child: MutedText(
                          title: "POSTS",
                          value: "18",
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: MutedText(
                          title: "TOTAL WEATHERS",
                          value: "4",
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: MutedText(
                          title: "MOST FREQUENT WEATHER",
                          value: "Sunny",
                        ),
                      ),
                    ]),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(),
            ),
          ],
        ));
  }
}

class MutedText extends StatelessWidget {
  final String title;
  final String value;
  const MutedText({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white24,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        )
      ],
    );
  }
}
