import 'package:astronaut_libraries/model/post/post_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<PostModel>> getPosts({
  String? userId,
}) async {
  List<PostModel>? postModel = [];

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

  return postModel;
}
