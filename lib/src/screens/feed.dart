import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:weather_share/src/screens/otherUsersProfile.dart';
import '../models/models.dart';
import '../services/cloud/getAllPosts.dart';
import '../utils/utils.dart';

class Feed extends StatefulWidget {
  Function selectWeatherType;
  Function getAllPosts;
  int weatherType;

  Feed(this.selectWeatherType, this.weatherType, this.getAllPosts, {super.key});

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  late List<Post> _posts = [];
  late bool _isLoading = false;
  late String _error = "";
  final controller = ScrollController();
  @override
  void initState() {
    super.initState();
    getFeedData();
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        getFeedData();
      }
    });
  }

  Future<void> getFeedData() async {
    try {
      setState(() {
        _isLoading = true;
      });
      final fetchedPosts = await widget.getAllPosts(_posts.length);
      setState(() {
        _posts = fetchedPosts;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = "Something went wrong!";
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
      backgroundColor: themeColor["primaryBG"],
      color: themeColor["active"],
      showChildOpacityTransition: true,
      springAnimationDurationInMilliseconds: 50,
      onRefresh: getFeedData,
      child: ListView(
        controller: controller,
        children: [
          Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: RecentInfo(widget.selectWeatherType, widget.weatherType)),
          const SizedBox(
            height: 20,
          ),
          (() {
            if (_error.isNotEmpty) {
              return Center(
                child: Text(
                  _error,
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              );
            }
            if (_isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              children: <Widget>[..._posts.map((e) => e.getPostContainer())],
            );
          }()),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}


//           FutureBuilder(
//             future: getAllPosts(),
//             builder: (BuildContext context, snapshot) {
//               if (snapshot.hasData) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 } else {
//                   final list = (snapshot.data)!.toList();
//                   return Column(
//                     children: <Widget>[
//                       ...list.map((e) => e.getPostContainer())
//                     ],
//                   );
//                 }
//               } else if (snapshot.hasError) {
//                 return Text("Something went wrong");
//               }
//               return const CircularProgressIndicator();
//             },
//           ),