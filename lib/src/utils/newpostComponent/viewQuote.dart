import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';

class ViewQuote extends StatelessWidget {
  final String quote;
  const ViewQuote(this.quote, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 300,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
        child: Container(
          color: const Color(0xffEAE5E4),
          child: SizedBox.fromSize(
            size: Size.fromRadius(
              MediaQuery.of(context).size.width,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.format_quote),
                    Text(
                      quote.split("-")[0],
                      style: const TextStyle(fontSize: 25),
                    ),
                    Text(
                      "-${quote.split("-").last}",
                      style: const TextStyle(fontSize: 12),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
