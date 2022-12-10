import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_share/src/models/models.dart';
import 'package:weather_share/src/screens/screens.dart';
import 'package:weather_share/src/utils/utils.dart';

import 'firebase_options.dart';
import 'src/services/cloud/getAllPosts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      title: "WeatherShare",
      theme: ThemeData(fontFamily: 'Itim'),
      home: const WeatherShare(),
    ),
  );
}

class WeatherShare extends StatefulWidget {
  const WeatherShare({super.key});

  @override
  State<WeatherShare> createState() => _WeatherShareState();
}

class _WeatherShareState extends State<WeatherShare> {
  int _selectedIndex = 0;
  int weatherType = 0;
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

  void selectWeatherType(int number) {
    // sunny = 1, cloudy = 2, snowy = 3, rainy = 4, clear = 5
    setState(() {
      weatherType = number;
    });
  }

  Future<List<Post>> getAllPosts(int totalPosts) async {
    final fetchedPosts = await fetchAllPosts(totalPosts);
    return fetchedPosts;
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
          child: Pages(_onItemTapped, selectWeatherType, pageController,
              weatherType, getAllPosts),
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
  Function selectWeatherType;
  PageController pageController;
  int weatherType;
  Function getAllPosts;
  Pages(this.pageValue, this.selectWeatherType, this.pageController,
      this.weatherType, this.getAllPosts,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      onPageChanged: (value) => pageValue(value),
      children: <Widget>[
        Feed(selectWeatherType, weatherType, getAllPosts),
        Newpost(),
        Profile()
      ],
    );
  }
}
