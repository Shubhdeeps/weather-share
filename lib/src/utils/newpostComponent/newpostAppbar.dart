import 'package:flutter/material.dart';

class NewpostAppbar extends StatelessWidget {
  const NewpostAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SizedBox(height: 50),
        Text(
          "New",
          style: TextStyle(color: Colors.white, fontSize: 32),
        ),
      ],
    );
  }
}
