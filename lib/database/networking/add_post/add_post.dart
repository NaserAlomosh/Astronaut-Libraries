import 'package:astronaut_libraries/database/local/shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future addPost({
  String? description,
  String? image,
  String? gitHubUrl,
  String? pubDevUrl,
}) async {
  var userId = getSharedPreferences('id');
  var postDoc = FirebaseFirestore.instance
      .collection('users')
      .doc('$userId')
      .collection('posts')
      .doc();

  ///Add Post///
  await FirebaseFirestore.instance
      .collection('users')
      .doc('$userId')
      .collection('posts')
      .doc()
      .set({
    'userId': userId,
    'postId': postDoc.id,
    'description': description,
    'image': image,
    'gitHubUrl': gitHubUrl,
    'pubDevUrl': pubDevUrl,
  });
}
