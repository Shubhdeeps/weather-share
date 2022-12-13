import 'dart:io';

import '../firebaseConfig.dart';

Future<String> uploadPostImageToCloud(
    File pickedImage, String bucketname) async {
  final path = '$bucketname/${pickedImage.path.split("/").last}';
  final ref = storageRef.child(path);
  await ref.putFile(pickedImage);
  final Future<String> url = ref.getDownloadURL();
  return url;
}
