import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../local/shared_preferences/shared_preferences.dart';

Future<void> removeFavoritePost({
  String? postId,
  String? userPostId,
}) async {
  try {
    var postsData = FirebaseFirestore.instance
        .collection('users')
        .doc(userPostId)
        .collection('posts')
        .doc(postId);
    var users = FirebaseFirestore.instance.collection('users');
    String id = getSharedPreferences('id');
    var value = await postsData.get();
    Map<String, dynamic>? postData = value.data();
    List<dynamic> favorite = postData!['favorite'];
    for (var i = 0; i < favorite.length; i++) {
      if (favorite[i]['id'] == id) {
        print(true);
        favorite.removeAt(i);
        await postsData.update({
          'likes': value['likes'],
          'image': postData['image'],
          'description': postData['description'],
          'gitHubUrl': postData['gitHubUrl'],
          'postId': postData['postId'],
          'pubDevUrl': postData['pubDevUrl'],
          'shareTime': postData['shareTime'],
          'userId': postData['userId'],
          'favorite': favorite,
        });
        await FirebaseFirestore.instance
            .collection('posts')
            .doc(postId)
            .update({
          'likes': value['likes'],
          'image': postData['image'],
          'description': postData['description'],
          'gitHubUrl': postData['gitHubUrl'],
          'postId': postData['postId'],
          'pubDevUrl': postData['pubDevUrl'],
          'shareTime': postData['shareTime'],
          'userId': postData['userId'],
          'favorite': favorite,
        });
        await users.doc(id).collection('favorite_posts').doc(postId).delete();
      }
    }
  } catch (e) {
    print('remove Like Error : $e');
  }
}
