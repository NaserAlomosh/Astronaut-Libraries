import 'package:astronaut_libraries/model/post/post_model.dart';
import 'package:astronaut_libraries/service/local/shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<PostModel>> getFavorite() async {
  List<PostModel> postModel = [];
  try {
    String id = getSharedPreferences('id');
    await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .collection('favorite_posts')
        .get()
        .then((value) {
      for (var element in value.docs) {
        postModel.add(PostModel.fromJosn(element.data()));
      }
    });
  } catch (e) {
    print('Get Faivorte Post Is Error : $e');
  }
  for (var element in postModel) {
    print(element.image);
  }
  return postModel;
}
