import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:weather_share/src/models/models.dart';

import '../firebaseConfig.dart';

// ignore: constant_identifier_names
const int AMOUNT_TO_BE_FETCHED = 5;
Future<List<Post>> fetchAllPosts(int lastVisibleItemNumber) async {
  late final List<Post> postsList = [];
  var dataRef = userPostRef
      .orderBy("created", descending: true)
      .limit(AMOUNT_TO_BE_FETCHED + lastVisibleItemNumber);

  final data = await dataRef.get() as QuerySnapshot<Map<String, dynamic>>;
  final posts = data.docs.map((doc) => doc.data()).toList();
  late final postSublist = posts.sublist(lastVisibleItemNumber);
  final usersIds = postSublist.map((eachPost) => eachPost["uid"]).toList();
  if (usersIds.isNotEmpty) {
    final users = await getAllUsersOfGivenUidList(usersIds);

    // loop through posts, and add users data to them
    for (final post in postSublist) {
      final userOfCurrentPost =
          users.firstWhere((element) => element.uid == post["uid"]);
      Post newPost = Post(
        post["uid"],
        post["imageURL"],
        post["temperature"],
        post["location"],
        post["weather_code"],
        post["created"],
        post["lat"],
        post["lon"],
        post["type"],
        userOfCurrentPost,
        false,
      );
      postsList.add(newPost);
    }
  }
  return postsList;
}

// it will always recieve 10 uids max
Future<List<User>> getAllUsersOfGivenUidList(uids) async {
  final data = await profileRef.where("uid", whereIn: uids).get()
      as QuerySnapshot<Map<String, dynamic>>;
  final users = data.docs.map((doc) => User.fromJson(doc.data()));
  return users.toList();
}

Future<List<Post>> fetchPostsOfCurrentUser(
    int lastVisibleItemNumber, User user) async {
  late final List<Post> postsList = [];
  var dataRef = userPostRef
      .orderBy("created", descending: true)
      .where("uid", isEqualTo: user.uid)
      .limit(AMOUNT_TO_BE_FETCHED + lastVisibleItemNumber);

  final data = await dataRef.get() as QuerySnapshot<Map<String, dynamic>>;
  final posts = data.docs.map((doc) => doc.data()).toList();
  late final postSublist = posts.sublist(lastVisibleItemNumber);

  // loop through posts, and add users data to them
  for (final post in postSublist) {
    Post newPost = Post(
      post["uid"],
      post["imageURL"],
      post["temperature"],
      post["location"],
      post["weather_code"],
      post["created"],
      post["lat"],
      post["lon"],
      post["type"],
      user,
      true,
    );
    postsList.add(newPost);
  }
  return postsList;
}
