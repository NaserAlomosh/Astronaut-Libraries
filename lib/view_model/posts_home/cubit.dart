import 'package:astronaut_libraries/model/post/post_model.dart';
import 'package:astronaut_libraries/service/networking/get_posts_home/get_posts_home.dart';
import 'package:astronaut_libraries/view_model/posts_home/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<PostModel>? postsModel;

class PostHomeCubit extends Cubit<PostHomeState> {
  PostHomeCubit() : super(PostHomeInitial());

  bool? showMore;
  Future<void> getPostHomeCubit() async {
    List<PostModel> data = [];
    try {
      // ;
      if (postsCount <= 4) {
        showMore = true;
        emit(PostHomeSucsses());
      } else {
        showMore = false;
        emit(PostHomeSucsses());
      }
      if (postsModel == null) {
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
    if (4 > postsLength) {
      showMore = false;
    } else {
      if (postsLength > (postsCount + 4)) {
        postsCount = postsCount + 4;
        if (postsCount == postsLength) {
          showMore = false;
        }
      } else {
        if (postsLength == postsCount) {
          showMore = false;
          emit(PostHomeNoMore());
        } else {
          showMore = false;
          postsCount = postsLength;
        }
      }
    }
    emit(PostHomeSucsses());
  }
}
