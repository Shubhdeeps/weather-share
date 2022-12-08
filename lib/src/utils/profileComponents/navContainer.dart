import 'package:flutter/material.dart';
import '../utils.dart';

class NavContainer extends StatelessWidget {
  final Function tabChange;
  final int tab;
  const NavContainer(this.tabChange, this.tab, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.elliptical(10, 20)),
                ),
                backgroundColor: tab == 0
                    ? const Color.fromARGB(10, 255, 255, 255)
                    : Colors.transparent,
              ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
              onPressed: () => tabChange(0),
              child: const Text('STATS'),
            ),
          ),
          Expanded(
            flex: 1,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.elliptical(10, 20)),
                ),
                backgroundColor: tab == 1
                    ? const Color.fromARGB(10, 255, 255, 255)
                    : Colors.transparent,
              ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
              onPressed: () => tabChange(1),
              child: const Text('SHARED'),
            ),
          ),
        ],
      ),
    );
  }
}
