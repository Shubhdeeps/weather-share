import 'package:flutter/material.dart';

class DashboardAppbar extends StatelessWidget {
  const DashboardAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SizedBox(height: 50),
        Text(
          "Recent",
          style: TextStyle(color: Colors.white, fontSize: 32),
        ),
      ],
    );
  }
}
