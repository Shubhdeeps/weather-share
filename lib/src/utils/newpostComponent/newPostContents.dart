import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:weather_share/src/services/cloud/uploadImageToStorage.dart';
import 'package:weather_share/src/utils/newpostComponent/viewPost.dart';
import 'package:weather_share/src/utils/styles/color.dart';

class NewPostContents extends StatefulWidget {
  NewPostContents({super.key});

  @override
  State<NewPostContents> createState() => _NewPostContentsState();
}

class _NewPostContentsState extends State<NewPostContents> {
  PlatformFile? pickedImage;

  Future pickImage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: false,
      allowedExtensions: ['jpg', 'jpeg', 'png'],
    );
    if (result == null) return;
    setState(() {
      pickedImage = result.files.first;
    });
  }

  Future postImage() async {
    final String url = await uploadPostImageToCloud(pickedImage!);
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
          ViewPost(pickedImage),
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
            CustomButtons("Choose a file", Icons.image_outlined, pickImage),
            const SizedBox(height: 22),
            const Text(
              "Or",
              style: TextStyle(color: Colors.white38, fontSize: 32),
            ),
            const SizedBox(height: 22),
            CustomButtons("Capture", Icons.camera_alt_outlined, buttonClick),
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
