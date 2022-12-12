import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/user.dart';
import '../firebaseConfig.dart';

Future<User> getUserBasedOnGivenUid(String uid) async {
  final data =
      await profileRef.doc(uid).get() as DocumentSnapshot<Map<String, dynamic>>;
  if (!data.exists) {
    throw "User not found!";
  }
  final user = User.fromJson(data.data()!);
  return user;
}
