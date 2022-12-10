import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:weather_share/src/models/models.dart';

import '../firebaseConfig.dart';

// Stream<List<Post>> getAllPosts() =>
//     userPostRef.snapshots().map((event) => event.docs
//         .map((doc) => Post.fromJson(doc.data() as Map<String, dynamic>))
//         .toList());

// Future<List<Post>> getAllPosts() async {
//   final data = await userPostRef
//       .orderBy("created", descending: true)
//       .limit(10)
//       .get() as QuerySnapshot<Map<String, dynamic>>;
//   final posts = data.docs.map((doc) => Post.fromJson(doc.data()));
//   final usersIds = posts.map((eachPost) => eachPost.uid);
//   if (usersIds.isNotEmpty) {
//     final users = await getAllUsersOfGivenUidList(usersIds.toList());
//     for (final post in posts) {
//       final userOfCurrentPost =
//           users.firstWhere((element) => element.uid == post.uid);
//       post.setUser(userOfCurrentPost);
//     }
//   }
//   return posts.toList();
// }

// // it will always recieve 10 uids max
// Future<List<User>> getAllUsersOfGivenUidList(List<String> uids) async {
//   final data = await profileRef.where("uid", whereIn: uids).get()
//       as QuerySnapshot<Map<String, dynamic>>;
//   final users = data.docs.map((doc) => User.fromJson(doc.data()));
//   return users.toList();
// }

final int AMOUNT_TO_BE_FETCHED = 2;
Future<List<Post>> fetchAllPosts(int lastVisibleItemNumber) async {
  late final List<Post> postsList = [];
  var dataRef = userPostRef
      .orderBy("created", descending: true)
      .limit(AMOUNT_TO_BE_FETCHED + lastVisibleItemNumber);

  final data = await dataRef.get() as QuerySnapshot<Map<String, dynamic>>;
  final posts = data.docs.map((doc) => doc.data());
  final usersIds = posts.map((eachPost) => eachPost["uid"]).toList();
  if (usersIds.isNotEmpty) {
    final users = await getAllUsersOfGivenUidList(usersIds);
    for (final post in posts) {
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
          userOfCurrentPost);
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
