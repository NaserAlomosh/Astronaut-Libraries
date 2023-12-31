import 'package:astronaut_libraries/model/post_details/post_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<PostDetailsModel?> getDetalisPost({
  required String userId,
  required String postId,
}) async {
  PostDetailsModel? postDetailsModel;
  try {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('posts')
        .doc(postId)
        .get()
        .then(
      (value) {
        postDetailsModel = PostDetailsModel.fromJosn(value.data()!);
      },
    );
  } catch (e) {
    print('Get Post Details Error : $e ');
  }
  return postDetailsModel;
}
