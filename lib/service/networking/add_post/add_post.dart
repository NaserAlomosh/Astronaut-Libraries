import 'dart:io';

import 'package:astronaut_libraries/service/local/shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

String? url;
Future<void> addPost({
  String? description,
  File? image,
  String? gitHubUrl,
  String? pubDevUrl,
}) async {
  var userId = getSharedPreferences('id');
  String? postDoc;
  FirebaseFirestore.instance
      .collection('users')
      .doc('$userId')
      .collection('posts')
      .add({}).then((DocumentReference doc) async {
    postDoc = doc.id;
  });

  ///Check Image///
  if (image != null) {
    var refStoreg = FirebaseStorage.instance.ref("images/$image");
    await refStoreg.putFile(image);
    url = await refStoreg.getDownloadURL();
  }

  ///Add Post///
  await FirebaseFirestore.instance
      .collection('users')
      .doc('$userId')
      .collection('posts')
      .doc(postDoc)
      .set({
    'userId': userId,
    'postId': postDoc,
    'description': description,
    'image': url,
    'gitHubUrl': gitHubUrl,
    'pubDevUrl': pubDevUrl,
  });
}
