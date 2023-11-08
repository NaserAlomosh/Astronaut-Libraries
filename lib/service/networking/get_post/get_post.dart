import 'package:astronaut_libraries/model/post/post_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<PostModel>> getPost({
  String? userId,
}) async {
  List<PostModel>? postModel = [];

  try {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('posts')
        .orderBy('shareTime', descending: true)
        .get()
        .then((value) {
      for (var element in value.docs) {
        postModel.add(PostModel.fromJosn(element.data()));
      }
    });
  } catch (e) {
    print('Get Posts Error : $e');
  }

  return postModel;
}
