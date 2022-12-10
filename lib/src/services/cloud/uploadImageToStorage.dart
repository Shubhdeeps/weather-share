import 'dart:io';

import 'package:file_picker/file_picker.dart';

import '../firebaseConfig.dart';

Future<String> uploadPostImageToCloud(File pickedImage) async {
  final path = 'userPosts/${pickedImage.path.split("/").last}';
  final ref = storageRef.child(path);
  await ref.putFile(pickedImage);
  final Future<String> url = ref.getDownloadURL();
  return url;
}
