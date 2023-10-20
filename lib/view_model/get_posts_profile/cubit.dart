import 'package:astronaut_libraries/model/post/post_model.dart';
import 'package:astronaut_libraries/service/local/shared_preferences/shared_preferences.dart';
import 'package:astronaut_libraries/service/networking/get_post/get_post.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../service/networking/like_post/like_post.dart';
import 'states.dart';

class GetPostsProfileCubit extends Cubit<GetPostsProfileState> {
  GetPostsProfileCubit() : super(GetPostsProfileInitial());
  List<PostModel> postProfile = [];
  getPostsProfileCubit() async {
    var userId = await getSharedPreferences('id');
    try {
      emit(GetPostsProfileLoading());
      postProfile = await getPost(userId: userId);

      emit(GetPostsProfilSucsses());
    } catch (_) {
      emit(GetPostsProfileError());
    }
  }
}
