import 'package:astronaut_libraries/service/networking/like_post/like_post.dart';
import 'package:astronaut_libraries/view_model/like_post/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LikeCubit extends Cubit<LikeState> {
  LikeCubit({
    required this.likes,
  }) : super(LikeInitial());
  bool? userLike;
  int likes;
  liked({String? postId, String? postUserId}) async {
    userLike = await likedPost(postId: postId, postUserId: postUserId);
    emit(LikeSucssesState());
  }

  likeCubit(String postId, String userPostId) async {
    if (userLike == false || userLike == null) {
      likes = likes + 1;
      userLike = true;
      emit(LikeSucssesState());
      await sendLikePost(postId, userPostId);
    } else {
      likes = likes - 1;
      userLike = false;
      emit(LikeSucssesState());
      await removeLikePost(postId, userPostId);
    }
  }
}
