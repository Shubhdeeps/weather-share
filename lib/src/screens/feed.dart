import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import '../models/models.dart';
import '../services/cloud/getAllPosts.dart';
import '../utils/utils.dart';

class Feed extends StatefulWidget {
  Position currentUserPosition;
  dynamic currentUserId;
  Feed(this.currentUserId, {super.key, required this.currentUserPosition});

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  late final List<Post> _posts = [];
  late String _error = "";
  final controller = ScrollController();
  bool hasMore = true;

// to avoid memory leak
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

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
      final fetchedPosts = await fetchAllPosts(_posts.length);
      setState(() {
        _posts.addAll(fetchedPosts);

        // if fetched posts are less then the amount of posts that supposed to be fetched (AMOUNT_T0_BE_FETCHED)
        if (fetchedPosts.length < 5) {
          hasMore = false;
        }
      });
    } catch (e) {
      _error = "Something went wrong!";
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
              if (index == 0) {
                return Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: RecentInfo(),
                    ),
                    item.getPostContainer()
                  ],
                );
              }
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
          }),
    );
  }
}
