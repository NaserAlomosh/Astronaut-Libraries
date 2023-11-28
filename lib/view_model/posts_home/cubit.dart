import 'package:astronaut_libraries/model/post/post_model.dart';
import 'package:astronaut_libraries/service/networking/get_posts_home/get_posts_home.dart';
import 'package:astronaut_libraries/view_model/posts_home/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<PostModel>? postsModel;

bool? showMore;

class PostHomeCubit extends Cubit<PostHomeState> {
  PostHomeCubit() : super(PostHomeInitial());

  Future<void> getPostHomeCubit() async {
    try {
      //
      if (postsCount <= 4) {
        showMore = true;
      } else {
        showMore = false;
      }
      if (postsModel == null) {
        postsModel = await getPostsHome();
        postsModel!.sort((a, b) => b.shareTime!.compareTo(a.shareTime!));
        emit(PostHomeSucsses());
        print('POSTS HOME CUBIT IN VIEW_MODEL FILE SUCSSES');
      }
    } catch (e) {
      print('POSTS HOME CUBIT VIEW_MODEL FILE ERROR : $e');
    }
  }

  showMorePosts() {
    if (postsCount <= 4) {
      showMore = true;
    } else {
      showMore = false;
    }
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
