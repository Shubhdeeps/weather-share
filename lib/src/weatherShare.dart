import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_share/src/pages/homepages.dart';
import 'package:weather_share/src/services/firebaseConfig.dart';
import 'package:weather_share/src/utils/utils.dart';

class WeatherShare extends StatefulWidget {
  final String currentUserId;
  const WeatherShare({super.key, required this.currentUserId});

  @override
  State<WeatherShare> createState() => _WeatherShareState();
}

class _WeatherShareState extends State<WeatherShare> {
  int _selectedIndex = 0;
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  Future<void> _onItemTapped(int index) async {
    Future.delayed(Duration.zero, () {
      setState(() {
        _selectedIndex = index;
        pageController.jumpToPage(index);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: themeColor["primaryBG"],
        ),
        toolbarHeight: 80,
        flexibleSpace: Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          color: themeColor["primaryBG"],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(height: 50),
              Text(
                "Weather share",
                style: TextStyle(color: Colors.white, fontSize: 32),
              ),
            ],
          ),
        ),
      ),
      body: SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: [
                Color(themeColor["primaryBG"]?.value ?? 0),
                Color(themeColor["secondaryBG"]?.value ?? 0),
              ],
            ),
          ),
          child: HomePage(
            _onItemTapped,
            pageController,
            currentUserId: widget.currentUserId,
          ),
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
          selectedItemColor: const Color(0xffD1306B),
          unselectedItemColor: const Color(0xff9D9D9D),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
