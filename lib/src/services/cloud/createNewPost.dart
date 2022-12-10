import 'package:weather_share/src/services/firebaseConfig.dart';

import '../../models/post.dart';

Future<void> createNewPost(Map<String, dynamic> post) async {
  userPostRef.add(post);
}
