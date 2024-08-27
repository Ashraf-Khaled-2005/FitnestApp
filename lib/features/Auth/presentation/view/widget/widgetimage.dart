import 'dart:io';

import 'package:flutter/material.dart';

class ImagePickerWidget extends StatelessWidget {
  final File? image;
  const ImagePickerWidget({
    super.key,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    if (image == null) {
      return const CircleAvatar(
        radius: 32,
        backgroundImage: AssetImage('assets/image/ima.jfif'),
      );
    } else {
      return CircleAvatar(
        radius: 32,
        backgroundImage: FileImage(image!),
      );
    }
  }
}
