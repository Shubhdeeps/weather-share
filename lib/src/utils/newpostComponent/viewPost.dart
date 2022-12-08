import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ViewPost extends StatelessWidget {
  final PlatformFile? pickedImage;
  const ViewPost(this.pickedImage, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 300,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
        child: Image.file(
          File(pickedImage!.path!),
          width: double.infinity,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
