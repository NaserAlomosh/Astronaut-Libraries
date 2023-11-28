import 'package:astronaut_libraries/service/local/shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> addFavoritePost({
  String? postId,
  String? userPostId,
}) async {
  try {
    var posts = FirebaseFirestore.instance
        .collection('users')
        .doc(userPostId)
        .collection('posts')
        .doc(postId);
    var users = FirebaseFirestore.instance.collection('users');
    String id = getSharedPreferences('id');
    await posts.get().then((value) async {
      List<dynamic> favorite = value['favorite'];
      favorite.add({
        'id': id,
        'favorite': true,
      });
      await posts.update({
        'likes': value['likes'],
        'image': value['image'],
        'description': value['description'],
        'gitHubUrl': value['gitHubUrl'],
        'postId': value['postId'],
        'pubDevUrl': value['pubDevUrl'],
        'shareTime': value['shareTime'],
        'userId': value['userId'],
        'favorite': favorite,
      });
      await users.doc(id).collection('favorite_posts').doc(postId).set({
        'likes': value['likes'],
        'image': value['image'],
        'userImage': value['userImage'],
        'description': value['description'],
        'gitHubUrl': value['gitHubUrl'],
        'postId': value['postId'],
        'pubDevUrl': value['pubDevUrl'],
        'shareTime': value['shareTime'],
        'userId': value['userId'],
        'name': value['name'],
        'favorite': favorite,
      });
    });
  } catch (e) {
    print('Add Like Error : $e');
  }
}
