import 'package:astronaut_libraries/model/post/post_model.dart';
import 'package:astronaut_libraries/service/local/shared_preferences/shared_preferences.dart';
import 'package:astronaut_libraries/service/networking/get_post/get_post.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'states.dart';

List<PostModel>? postsProfile;

class GetPostsProfileCubit extends Cubit<GetPostsProfileState> {
  GetPostsProfileCubit() : super(GetPostsProfileInitial());

  getPostsProfileCubit(String? userId) async {
    var id = getSharedPreferences('id');
    try {
      emit(GetPostsProfileLoading());
      var a = await getPosts(userId: userId ?? id);
      postsProfile = a;
      emit(GetPostsProfilSucsses());
    } catch (_) {
      emit(GetPostsProfileError());
    }
  }
}
