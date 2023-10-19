import 'package:astronaut_libraries/service/networking/like_post/like_post.dart';
import 'package:astronaut_libraries/view_model/like_post/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LikeCubit extends Cubit<LikeState> {
  LikeCubit({
    required this.likes,
    required this.userLike,
  }) : super(LikeInitial());
  bool userLike;
  int likes;
  likeCubit(String postUserId, String postId) async {
    if (userLike) {
      likes = likes - 1;
      userLike = false;
      emit(LikeSucssesState());
      await removeLikePost(postUserId, postId);
    } else {
      likes = likes + 1;
      userLike = true;
      emit(LikeSucssesState());
      await sendLikePost(postUserId, postId);
    }
  }
}
