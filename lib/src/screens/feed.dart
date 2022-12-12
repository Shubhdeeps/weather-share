import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:weather_share/src/utils/posts/postsFeed.dart';
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
      child: PostFeed(
        controller: controller,
        posts: _posts,
        error: _error,
        hasMore: hasMore,
        child: RecentInfo(
          currentUserPosition: widget.currentUserPosition,
        ),
      ),
    );
  }
}
