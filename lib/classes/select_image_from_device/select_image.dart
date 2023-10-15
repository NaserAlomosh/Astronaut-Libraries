import 'dart:io';

import 'package:image_picker/image_picker.dart';

Future<File?> getImagePicker() async {
  ImagePicker picker = ImagePicker();

  XFile? imagePicked = await picker.pickImage(source: ImageSource.gallery);
  //start upload
  if (imagePicked != null) {
    // selected
    print(imagePicked.path);
    return File(imagePicked.path);
  } else {}
  return null;
}
