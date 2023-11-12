import 'package:astronaut_libraries/model/post/post_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<PostModel>> getPostsHome() async {
  List<PostModel>? postsModel = [];
  try {
    var users = FirebaseFirestore.instance.collection('users');
    await users.get().then((value) async {
      for (var element in value.docs) {
        await users.doc(element.id).collection('posts').get().then(
          (a) {
            for (var element in a.docs) {
              if (element.data() != {}) {
                print('##########');
                postsModel.add(PostModel.fromJosn(element.data()));
              }
            }
            for (var i = 0; i < postsModel.length; i++) {
              print(postsModel[i].shareTime);
            }
          },
        );
      }
      return postsModel;
    });
  } catch (e) {
    print(e);
  }
  return postsModel;
}
