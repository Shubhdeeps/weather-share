import 'package:flutter/material.dart';
import 'package:weather_share/src/screens/profile.dart';

void main() => runApp(const MaterialApp(
      home: WeatherShare(),
    ));

class WeatherShare extends StatefulWidget {
  const WeatherShare({super.key});

  @override
  State<WeatherShare> createState() => _WeatherShareState();
}

class _WeatherShareState extends State<WeatherShare> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      print(index);
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff2D143B),
                Color(0xff161333),
              ],
            ),
          ),
          child: Profile(),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomNavigationBar(
          backgroundColor: const Color(0xff212042),
          unselectedFontSize: 8,
          selectedFontSize: 12,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle),
              label: 'New Post',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          iconSize: 32,
          selectedItemColor: Color(0xffD1306B),
          unselectedItemColor: Color(0xff9D9D9D),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
