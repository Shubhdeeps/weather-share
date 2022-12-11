import 'package:flutter/material.dart';

import '../utils.dart';

void weatherForecaseModal(context) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (BuildContext context) {
      return Container(
        margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
              topRight: Radius.circular(30)),
          color: themeColor["secondaryFG"],
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.95,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 10, 20, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Weather forecast Tallinn",
                style: const TextStyle(fontSize: 18, color: Colors.white54),
              ),
            ],
          ),
        ),
      );
    },
  );
}
