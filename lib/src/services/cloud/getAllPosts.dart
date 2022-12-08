import 'package:weather_share/src/models/models.dart';

import '../firebaseConfig.dart';

Future<void> getAllPosts() async {
  final docs = await userPostRef.orderBy("created", descending: true).get();
  final List<Post> userposts = [];

  for (final doc in docs.docs) {
    final postFetched = doc.data();
    final String uid = postFetched!.uid ?? "";
    // Post user = Post(
    //     postFetched.uid,
    //     postFetched.imageURL,
    //     postFetched.temperature,
    //     postFetched.location,
    //     postFetched.weather_code,
    //     postFetched.created,
    //     postFetched.lat,
    //     postFetched.lon,
    //     postFetched.type);
  }
}
