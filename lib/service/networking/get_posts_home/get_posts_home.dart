import 'package:astronaut_libraries/model/post/post_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

int postsCount = 4;
int refreshPosts = 4;
int postsLength = 0;
Future<List<PostModel>> getPostsHome() async {
  List<PostModel>? postsModel = [];
  try {
    var posts = FirebaseFirestore.instance.collection('posts');
    await posts.get().then((value) {
      postsLength = value.docs.length;
      if (postsLength > refreshPosts) {
        postsCount = refreshPosts;
      } else {
        postsCount = postsLength;
      }
    });
    await posts.get().then((value) async {
      for (var element in value.docs) {
        postsModel.add(PostModel.fromJosn(element.data()));
      }
      print(
        'GET HOME POSTS FUNCTION IN THE NETWORKING FILE LOCATED INSIDE THE SERVICES FILE SUCSSES.',
      );
      return postsModel;
    });
  } catch (e) {
    print(
      'GET HOME POSTS FUNCTION IN THE NETWORKING FILE LOCATED INSIDE THE SERVICES FILE ERROR : $e.',
    );
  }
  return postsModel;
}

showMore() {}
