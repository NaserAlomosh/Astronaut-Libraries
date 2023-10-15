import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

Future<bool> addNewLibrary({
  required String? name,
  required File? image,
  required String? gitHubUrl,
  required String? pubDevUrl,
  required String? description,
  required String? type,
}) async {
  //
  if (image != null) {
    var refStoreg = FirebaseStorage.instance.ref("images/$image");
    await refStoreg.putFile(image);
    String url = await refStoreg.getDownloadURL();
    await FirebaseFirestore.instance
        .collection(type!)
        .add({}).then((DocumentReference doc) async {
      await FirebaseFirestore.instance.collection(type).doc(doc.id).set({
        'name': name,
        'image': url,
        'gitHubUrl': gitHubUrl,
        'pubDevUrl': pubDevUrl,
        'type': type,
        'id': doc.id,
      }).then((_) {
        return true;
      });
    });
  }
  return false;
}
