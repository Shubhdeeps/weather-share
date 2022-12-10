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
  late String _error = "";
  final controller = ScrollController();
  bool hasMore = true;
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
      final fetchedPosts =
          await widget.getAllPosts(_posts.length) as List<Post>;
      setState(() {
        _posts.addAll(fetchedPosts);

        // if fetched posts are less then the amount of posts that supposed to be fetched (AMOUNT_T0_BE_FETCHED)
        if (fetchedPosts.length < 2) {
          hasMore = false;
        }
      });
    } catch (e) {
      print(e);
      setState(() {
        _error = "Something went wrong!";
      });
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
      backgroundColor: themeColor["primaryBG"],
      color: themeColor["active"],
      showChildOpacityTransition: true,
      springAnimationDurationInMilliseconds: 50,
      onRefresh: getFeedData,
      child: ListView.builder(
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
        controller: controller,
        itemCount: _posts.length + 1,
        itemBuilder: (BuildContext context, int index) {
          print("index: $index");
          if (_error.isNotEmpty) {
            return Center(
              child: Text(
                _error,
                style: const TextStyle(color: Colors.white, fontSize: 22),
              ),
            );
          }
          if (index < _posts.length) {
            final item = _posts[index];
            return item.getPostContainer();
          } else {
            return Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 40),
              child: Center(
                child: hasMore
                    ? const CircularProgressIndicator()
                    : const Text(
                        "No more posts to load!",
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
              ),
            );
          }
        },
      ),
    );
  }
}


  //  Container(
  //               padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
  //               child: RecentInfo(widget.selectWeatherType, widget.weatherType),
  //             ),


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