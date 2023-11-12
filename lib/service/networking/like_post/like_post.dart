import 'package:astronaut_libraries/service/local/shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> sendLikePost(
  String? postId,
  String? userPostId,
) async {
  try {
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
  } catch (e) {
    print('Add Like Error : $e');
  }
}

Future<void> removeLikePost(
  String? postId,
  String? userPostId,
) async {
  try {
    var postsData = FirebaseFirestore.instance
        .collection('users')
        .doc(userPostId)
        .collection('posts')
        .doc(postId);

    var value = await postsData.get();
    Map<String, dynamic>? postData = value.data();
    List<dynamic> likes = postData!['likes'];
    for (var i = 0; i < likes.length; i++) {
      if (likes[i]['id'] == getSharedPreferences('id')) {
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
  } catch (e) {
    print('remove Like Error : $e');
  }
}
