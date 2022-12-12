import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:weather_share/src/models/models.dart';
import 'package:weather_share/src/services/cloud/uploadImageToStorage.dart';
import 'package:weather_share/src/services/firebaseConfig.dart';

import '../utils.dart';

Future<void> uploadUserImage(String uid, Function reload) async {
  final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
  if (pickedFile == null) return null;
  final file = File(pickedFile.path);
  final image = await ImageCropper().cropImage(
    sourcePath: file.path,
    aspectRatio: const CropAspectRatio(ratioX: 1.1, ratioY: 1),
    compressQuality: 10,
  );
  File imgFile = File(image!.path!);
  final String newProfileURL =
      await uploadPostImageToCloud(imgFile, "profileImages");

  await profileRef.doc(uid).update({
    "profileURL": newProfileURL,
  });
  reload();
}

void userProfileModal(context, User user, Function reload) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (BuildContext context) {
      return Stack(children: [
        Container(
          margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
                topRight: Radius.circular(30)),
            color: themeColor["secondaryFG"],
            boxShadow: [BorderShadow()],
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(children: [
            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                // color: themeColor["secondaryFG"]
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(themeColor["active"]?.value ?? 0),
                    Color(themeColor["active2"]?.value ?? 0),
                  ],
                ),
              ),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  user.profileURL.isEmpty
                      ? "https://cdn.pixabay.com/photo/2016/09/28/02/14/user-1699635_960_720.png"
                      : user.profileURL,
                ),
                radius: 50,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ActionRow(
              title: "Change profile image",
              icon: Icons.camera_alt,
              buttonClick: () {
                uploadUserImage(user.uid, reload);
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: 30,
            ),
            ActionRow(
              title: "Log out",
              icon: Icons.logout,
              buttonClick: () {
                Navigator.pop(context);
                auth.signOut();
              },
            )
          ]),
        ),
      ]);
    },
  );
}

class ActionRow extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function buttonClick;
  const ActionRow(
      {super.key,
      required this.title,
      required this.icon,
      required this.buttonClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => buttonClick(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white10,
        ),
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Row(children: [
          IconTheme(
            data: IconThemeData(color: themeColor["active"]),
            child: Icon(icon),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 22),
          )
        ]),
      ),
    );
  }
}
