import 'dart:math';

import 'package:flutter/material.dart';
import 'package:weather_share/src/services/cloud/getAllPosts.dart';
import 'package:weather_share/src/utils/posts/postsFeed.dart';

import '../../models/models.dart';
import '../utils.dart';

class ProfileView extends StatefulWidget {
  final User user;
  final Widget child;
  const ProfileView({
    super.key,
    required this.user,
    required this.child,
  });

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final List<Post> _posts = [];
  String _error = "";
  ScrollController controller = ScrollController();
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
      final fetchedPosts =
          await fetchPostsOfCurrentUser(_posts.length, widget.user);
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
    return PostFeed(
      controller: controller,
      posts: _posts,
      error: _error,
      hasMore: hasMore,
      child: widget.child,
    );
  }
}
