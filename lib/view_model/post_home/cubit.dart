import 'package:astronaut_libraries/model/post/post_model.dart';
import 'package:astronaut_libraries/service/networking/get_posts_home/get_posts_home.dart';
import 'package:astronaut_libraries/view_model/post_home/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<PostModel>? postsModel;

class PostHomeCubit extends Cubit<PostHomeState> {
  PostHomeCubit() : super(PostHomeInitial());

  Future<void> getPostHomeCubit() async {
    try {
      if (postsModel == null) {
        List<PostModel>? dataPost = await getPostsHome();
        postsModel = dataPost;
        postsModel!.sort((a, b) => b.shareTime!.compareTo(a.shareTime!));

        emit(PostHomeSucsses());
      }
    } catch (e) {
      print('NNNNNNNNNNNNN');
    }
  }
}
