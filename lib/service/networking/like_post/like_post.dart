import 'package:astronaut_libraries/model/post/post_model.dart';
import 'package:astronaut_libraries/service/local/shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> sendLikePost(
  String? postUserId,
  String? postId,
) async {
  List likes = [];
  await FirebaseFirestore.instance
      .collection('users')
      .doc(postUserId)
      .collection('posts')
      .doc(postId)
      .get()
      .then((value) {
    PostModel postModel = PostModel.fromJosn(value.data()!);
    likes = postModel.likes;
    likes.add({
      'id': getSharedPreferences('id'),
      'like': true,
    });
    FirebaseFirestore.instance
        .collection('users')
        .doc(postUserId)
        .collection('posts')
        .doc(postId)
        .update({
      'likes': likes,
      'image': postModel.image,
      'description': postModel.description,
      'gitHubUrl': postModel.gitHubUrl,
      'postId': postModel.postId,
      'pubDevUrl': postModel.pubDevUrl,
      'shareTime': postModel.shareTime,
      'userId': postModel.userId,
    });
  });
}

Future<void> removeLikePost(
  String? postUserId,
  String? postId,
) async {
  await FirebaseFirestore.instance
      .collection('users')
      .doc(postUserId)
      .collection('posts')
      .doc(postId)
      .get()
      .then((value) {
    PostModel postModel = PostModel.fromJosn(value.data()!);
    for (var i = 0; i < postModel.likes.length; i++) {
      if (postModel.likes[i].id == getSharedPreferences('id')) {}
      List removeList = postModel.likes;
      removeList.removeAt(i);
      FirebaseFirestore.instance
          .collection('users')
          .doc(postUserId)
          .collection('posts')
          .doc(postId)
          .update({
        'likes': removeList,
        'image': postModel.image,
        'description': postModel.description,
        'gitHubUrl': postModel.gitHubUrl,
        'postId': postModel.postId,
        'pubDevUrl': postModel.pubDevUrl,
        'shareTime': postModel.shareTime,
        'userId': postModel.userId,
      });
    }
  });
}
