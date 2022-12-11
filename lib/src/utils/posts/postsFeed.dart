import 'package:flutter/material.dart';
import 'package:weather_share/src/models/models.dart';

class PostFeed extends StatelessWidget {
  final ScrollController controller;
  final List<Post> posts;
  final String error;
  final bool hasMore;
  final Widget? child;
  PostFeed(
      {super.key,
      required this.controller,
      required this.posts,
      required this.error,
      required this.hasMore,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
        controller: controller,
        itemCount: posts.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (error.isNotEmpty) {
            return Center(
              child: Text(
                error,
                style: const TextStyle(color: Colors.white, fontSize: 22),
              ),
            );
          }
          if (index < posts.length) {
            final item = posts[index];
            if (index == 0) {
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: child,
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
        });
  }
}
