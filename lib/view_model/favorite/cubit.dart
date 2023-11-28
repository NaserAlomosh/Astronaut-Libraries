import 'package:astronaut_libraries/service/networking/favorite/posts/remove_favorite.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/post/post_model.dart';
import '../../service/networking/favorite/posts/get_favorite.dart';

part 'state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  bool saved = true;
  FavoriteCubit() : super(FavoriteInitial());
  List<PostModel> postModel = [];
  getFavoriteCubit() async {
    emit(FavoriteLoading());
    postModel = await getFavorite();
    emit(FavoriteSuccess());
  }

  removeAndAddFavoritePostCubit({
    String? postId,
    String? userPostId,
    bool? save,
  }) async {
    emit(FavoriteLoading());
    postModel = [];
    await removeFavoritePost(postId: postId, userPostId: userPostId);
    await getFavoriteCubit();
    emit(FavoriteSuccess());
  }
}
