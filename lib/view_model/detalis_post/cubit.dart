import 'package:astronaut_libraries/service/local/shared_preferences/shared_preferences.dart';
import 'package:astronaut_libraries/service/networking/get_detalis_post/get_detalis_post.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/post_details/post_details.dart';
import '../../service/networking/like_post/like_post.dart';
import 'states.dart';

class DetalisPostCubit extends Cubit<DetalisPostState> {
  DetalisPostCubit() : super(DetalisPostInitial());
  PostDetailsModel? postDetailsModel;
  bool userIsLiked = false;
  void getDetalisPostCubit({
    required String userId,
    required String postId,
  }) async {
    emit(DetalisPostLoading());
    postDetailsModel = await getDetalisPost(userId: userId, postId: postId);
  }

  Future userLiked({
    required String userId,
    required String postId,
  }) async {
    String id = getSharedPreferences('id');
    PostDetailsModel? postDetailsModel =
        await getDetalisPost(userId: userId, postId: postId);
    for (var element in postDetailsModel!.likes) {
      if (id == element.id) {
        userIsLiked = true;
      }
    }
    emit(DetalisPostSuccess());
  }

  sendLikeCubit(String? postId, String? postUserId) async {
    await sendLikePost(postId, postUserId);
  }

  removeLikeCubit(String? postId, String? postUserId) async {
    await removeLikePost(postId, postUserId);
  }
}
