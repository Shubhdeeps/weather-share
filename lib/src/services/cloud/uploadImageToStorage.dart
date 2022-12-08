import 'dart:io';

import 'package:file_picker/file_picker.dart';

import '../firebaseConfig.dart';

Future<String> uploadPostImageToCloud(PlatformFile pickedImage) async {
  final path = 'userPosts/${pickedImage!.name}';
  final file = File(pickedImage!.path!);
  final ref = storageRef.child(path);
  await ref.putFile(file);
  final Future<String> url = ref.getDownloadURL();
  return url;
}
