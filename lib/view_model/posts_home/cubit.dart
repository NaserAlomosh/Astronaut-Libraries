import 'package:astronaut_libraries/model/post/post_model.dart';
import 'package:astronaut_libraries/service/networking/get_posts_home/get_posts_home.dart';
import 'package:astronaut_libraries/view_model/posts_home/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<PostModel>? postsModel;

class PostHomeCubit extends Cubit<PostHomeState> {
  PostHomeCubit() : super(PostHomeInitial());
  bool showMore = true;
  Future<void> getPostHomeCubit() async {
    List<PostModel> data = [];
    try {
      // ;
      if (postsModel == null) {
        emit(PostHomeLoading());
        data = await getPostsHome();
        postsModel = data;
        postsModel!.sort((a, b) => b.shareTime!.compareTo(a.shareTime!));
        emit(PostHomeSucsses());
        print('POSTS HOME CUBIT IN VIEW_MODEL FILE SUCSSES');
      }
    } catch (e) {
      print('POSTS HOME CUBIT VIEW_MODEL FILE ERROR : $e');
    }
  }

  showMorePosts() {
    //postsModel = [];
    if (postsLength > (postsCount + 4)) {
      postsCount = postsCount + 4;
    } else {
      if (postsLength == postsCount) {
        showMore = false;
        emit(PostHomeNoMore());
      } else {
        postsCount = postsLength;
      }
    }
    emit(PostHomeSucsses());
  }
}
