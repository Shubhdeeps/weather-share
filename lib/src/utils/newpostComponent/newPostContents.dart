import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:weather_share/src/services/api/generateRandomQuote.dart';
import 'package:weather_share/src/services/cloud/uploadImageToStorage.dart';
import 'package:weather_share/src/utils/utils.dart';

import '../../services/api/getLocationUsingLatLong.dart';
import '../../services/api/getWeatherUsingLatLong.dart';
import '../../services/firebaseConfig.dart';

class NewPostContents extends StatefulWidget {
  Position currentUserPosition;
  final String currentUserId;
  NewPostContents({
    super.key,
    required this.currentUserPosition,
    required this.currentUserId,
  });

  @override
  State<NewPostContents> createState() => _NewPostContentsState();
}

class _NewPostContentsState extends State<NewPostContents> {
  dynamic pickedImage;
  bool isLoding = false;
  bool isImage = true;
  String error = "";

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  Future pickGalleryImage() async {
    try {
      final pickedFile =
          await ImagePicker().getImage(source: ImageSource.gallery);
      if (pickedFile == null) return null;
      final file = File(pickedFile.path);
      cropImage(file);
    } catch (e) {
      error = "Something went wrong!";
      isLoding = false;
    }
  }

  Future pickCameraImage() async {
    try {
      final pickedFile =
          await ImagePicker().getImage(source: ImageSource.camera);
      if (pickedFile == null) return null;
      final file = File(pickedFile.path);
      cropImage(file);
    } catch (e) {
      error = "Something went wrong!";
      isLoding = false;
    }
  }

  Future<void> cropImage(File file) async {
    try {
      final image = await ImageCropper().cropImage(
        sourcePath: file.path,
        aspectRatio: const CropAspectRatio(ratioX: 1.1, ratioY: 1),
        compressQuality: 10,
      );
      File imgFile = File(image!.path!);
      setState(() {
        pickedImage = imgFile;
      });
    } catch (e) {
      error = "Something went wrong!";
      isLoding = false;
    }
  }

  Future<void> generateQuote() async {
    try {
      setState(() {
        isLoding = true;
      });
      final quoteGenerated = await generateRandomQuote();
      final quote = quoteGenerated["quote"];
      final author = quoteGenerated["author"];
      setState(() {
        isImage = false;
        pickedImage = "$quote -$author";
      });

      setState(() {
        isLoding = false;
      });
    } catch (e) {
      error = "Something went wrong!";
      isLoding = false;
    }
  }

  Future postImage() async {
    try {
      setState(() {
        isLoding = true;
      });

      late String imageSrc;
      if (isImage) {
        final String url =
            await uploadPostImageToCloud(pickedImage!, "userPosts");
        imageSrc = url;
      } else {
        imageSrc = pickedImage;
        imageSrc = pickedImage.toString();
      }

      final lat = widget.currentUserPosition.latitude;
      final long = widget.currentUserPosition.longitude;
      final location = await getUserLocationUsingLatLong(lat, long);
      final weather = await getWeatherUsingLatLong(lat, long);
      Map<String, dynamic> newPost = {
        "created": Timestamp.now(),
        "imageURL": imageSrc,
        "uid": widget.currentUserId,
        "lat": lat,
        "lon": long,
        "location": location["address"]["city"],
        "temperature": weather["current_weather"]["temperature"],
        "type": isImage ? "POST" : "QUOTE",
        "weather_code": weather["current_weather"]["weathercode"],
      };
      await userPostRef.add(newPost);
      deleteImage();
      setState(() {
        isLoding = false;
      });
    } catch (e) {
      error = "Something went wrong!";
      isLoding = false;
    }
  }

  void deleteImage() {
    setState(() {
      pickedImage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: (() {
      if (error.isNotEmpty) {
        return Center(
          child: Text(
            error,
            style: const TextStyle(
              fontSize: 32,
              color: Colors.white,
            ),
          ),
        );
      }
      if (isLoding) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (pickedImage != null) {
        return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          if (isImage) ViewPost(pickedImage!),
          if (!isImage) ViewQuote(pickedImage!),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PostorDeleteButton(
                  "Delete",
                  btnClick: deleteImage,
                  themeColor["active2"]!,
                ),
                const SizedBox(width: 10),
                PostorDeleteButton(
                  "Post",
                  btnClick: () => postImage(),
                  themeColor["active"]!,
                ),
              ],
            ),
          )
        ]);
      } else {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
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
              CustomButtons("Post a random quote", Icons.format_quote_sharp,
                  generateQuote)
            ],
          ),
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
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(18)),
        ),
        backgroundColor: Colors.white10,
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
    );
  }
}

class PostorDeleteButton extends StatelessWidget {
  final String title;
  final Function btnClick;
  final Color color;
  const PostorDeleteButton(
    this.title,
    this.color, {
    super.key,
    required this.btnClick,
  });

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
