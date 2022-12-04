import 'package:flutter/material.dart';
import '../utils.dart';

class NavContainer extends StatefulWidget {
  const NavContainer({super.key});

  @override
  State<NavContainer> createState() => _NavContainerState();
}

class _NavContainerState extends State<NavContainer> {
  int _btnSelected = 0;
  void _buttonPress(int num) {
    setState(() {
      _btnSelected = num;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(00, 10, 0, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              backgroundColor: _btnSelected == 0
                  ? themeColor["highlighted"]
                  : themeColor["transparent"],
            ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
            onPressed: () => _buttonPress(0),
            child: const Text('STATS'),
          ),
          SizedBox(width: 5),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              backgroundColor: _btnSelected == 1
                  ? themeColor["highlighted"]
                  : themeColor["transparent"],
            ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
            onPressed: () => _buttonPress(1),
            child: const Text('SHARED'),
          ),
        ],
      ),
    );
  }
}
