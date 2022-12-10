import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:weather_share/src/services/cloud/uploadImageToStorage.dart';
import 'package:weather_share/src/utils/newpostComponent/viewPost.dart';
import 'package:weather_share/src/utils/styles/color.dart';

import '../../services/firebaseConfig.dart';

class NewPostContents extends StatefulWidget {
  NewPostContents({super.key});

  @override
  State<NewPostContents> createState() => _NewPostContentsState();
}

class _NewPostContentsState extends State<NewPostContents> {
  File? pickedImage;

  Future pickGalleryImage() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile == null) return null;
    final file = File(pickedFile.path);
    cropImage(file);
  }

  Future pickCameraImage() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.camera);
    if (pickedFile == null) return null;
    final file = File(pickedFile.path);
    cropImage(file);
  }

  Future<void> cropImage(File file) async {
    final image = await ImageCropper().cropImage(
      sourcePath: file.path,
      aspectRatio: const CropAspectRatio(ratioX: 1.1, ratioY: 1),
      compressQuality: 10,
    );
    File imgFile = File(image!.path!);
    setState(() {
      pickedImage = imgFile;
    });
  }

  Future postImage() async {
    final String url = await uploadPostImageToCloud(pickedImage!);
    Map<String, dynamic> newPost = {
      "created": Timestamp.now(),
      "imageURL": url,
      "uid": "tester-author",
      "lat": 59.43,
      "lon": 24.75,
      "location": "Tallinn",
      "temperature": -5,
      "type": "POST",
      "weather_code": 2,
    };
    await userPostRef.add(newPost);
    deleteImage();
  }

  void deleteImage() {
    setState(() {
      pickedImage = null;
    });
  }

  void buttonClick() {
    print("clicked");
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: (() {
      if (pickedImage != null) {
        return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ViewPost(pickedImage!),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PostorDeleteButton(
                    "Delete", deleteImage, themeColor["active2"]!),
                SizedBox(width: 10),
                PostorDeleteButton("Post", postImage, themeColor["active"]!),
              ],
            ),
          )
        ]);
      } else {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButtons(
                "Choose a file", Icons.image_outlined, pickGalleryImage),
            const SizedBox(height: 22),
            const Text(
              "Or",
              style: TextStyle(color: Colors.white38, fontSize: 32),
            ),
            const SizedBox(height: 22),
            CustomButtons(
                "Capture", Icons.camera_alt_outlined, pickCameraImage),
            const SizedBox(height: 22),
            const Text(
              "Or",
              style: TextStyle(color: Colors.white38, fontSize: 32),
            ),
            const SizedBox(height: 22),
            CustomButtons(
                "Post a random quote", Icons.format_quote_sharp, buttonClick)
          ],
        );
      }
    }()));
  }
}

class CustomButtons extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function btnClick;
  const CustomButtons(this.title, this.icon, this.btnClick, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(18)),
          ),
          backgroundColor: themeColor["active"],
        ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
        onPressed: () {
          btnClick();
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 12, 0, 12),
          child: Row(children: [
            Icon(icon),
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 26),
            ),
          ]),
        ),
      ),
    );
  }
}

class PostorDeleteButton extends StatelessWidget {
  final String title;
  final Function btnClick;
  final Color color;
  const PostorDeleteButton(this.title, this.btnClick, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(18)),
          ),
          backgroundColor: color,
        ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
        onPressed: () {
          btnClick();
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 7, 0, 7),
          child: Text(
            title,
            style: const TextStyle(fontSize: 26),
          ),
        ),
      ),
    );
  }
}
