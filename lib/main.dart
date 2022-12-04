import 'package:flutter/material.dart';
import 'package:weather_share/src/screens/screens.dart';
import 'package:weather_share/src/utils/utils.dart';

void main() => runApp(MaterialApp(
      title: "WeatherShare",
      theme: ThemeData(fontFamily: 'Itim'),
      home: const WeatherShare(),
    ));

class WeatherShare extends StatefulWidget {
  const WeatherShare({super.key});

  @override
  State<WeatherShare> createState() => _WeatherShareState();
}

class _WeatherShareState extends State<WeatherShare> {
  int _selectedIndex = 0;

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: (() {
          if (_selectedIndex == 2) {
            return 200.toDouble();
          } else {
            return 80.toDouble();
          }
        }()),
        flexibleSpace: Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          color: themeColor["primaryBG"],
          child: (() {
            if (_selectedIndex == 0) {
              return const DashboardAppbar();
            } else if (_selectedIndex == 2) {
              return const ProfileAppbar();
            } else {
              return const NewpostAppbar();
            }
          }()),
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
          child: Pages(_onItemTapped, pageController),
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

class Pages extends StatelessWidget {
  Function pageValue;
  PageController pageController;
  Pages(this.pageValue, this.pageController, {super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      onPageChanged: (value) => pageValue(value),
      children: <Widget>[Feed(), NewPost(), Profile()],
    );
  }
}
