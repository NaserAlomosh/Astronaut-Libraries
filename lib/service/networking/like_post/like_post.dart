import 'package:astronaut_libraries/model/post/post_model.dart';
import 'package:astronaut_libraries/service/local/shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> sendLikePost(
  String? postId,
  String? userPostId,
) async {
  var posts = FirebaseFirestore.instance
      .collection('users')
      .doc(userPostId)
      .collection('posts')
      .doc(postId);
  await posts.get().then((value) async {
    List<dynamic> likes = value['likes'];
    likes.add({
      'id': getSharedPreferences('id'),
      'like': true,
    });
    await posts.update({
      'likes': likes,
      'image': value['image'],
      'description': value['description'],
      'gitHubUrl': value['gitHubUrl'],
      'postId': value['postId'],
      'pubDevUrl': value['pubDevUrl'],
      'shareTime': value['shareTime'],
      'userId': value['userId'],
    });
  });
}

Future<void> removeLikePost(
  String? postId,
  String? userPostId,
) async {
  var postsData = FirebaseFirestore.instance
      .collection('users')
      .doc(userPostId)
      .collection('posts')
      .doc(postId);

  var value = await postsData.get();
  Map<String, dynamic>? postData = value.data();
  List<dynamic> likes = postData!['likes'];
  for (var i = 0; i < likes.length; i++) {
    if (likes[i]['id'] == await getSharedPreferences('id')) {
      print(true);
      likes.removeAt(i);
      await postsData.update({
        'likes': likes,
        'image': postData['image'],
        'description': postData['description'],
        'gitHubUrl': postData['gitHubUrl'],
        'postId': postData['postId'],
        'pubDevUrl': postData['pubDevUrl'],
        'shareTime': postData['shareTime'],
        'userId': postData['userId'],
      });
    }
  }
}

Future<bool> likedPost({String? postId, String? postUserId}) async {
  var posts = await FirebaseFirestore.instance
      .collection('users')
      .doc(postUserId)
      .collection('posts')
      .doc(postId)
      .get();
  PostModel postData = PostModel.fromJosn(posts.data()!);
  for (var i = 0; i < postData.likes.length; i++) {
    if (postData.likes[i].id == getSharedPreferences('id')) {
      return true;
    }
  }
  return false;
}
