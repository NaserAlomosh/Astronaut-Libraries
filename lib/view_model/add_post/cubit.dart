import 'dart:io';

import 'package:astronaut_libraries/classes/select_image_from_device/select_image.dart';
import 'package:astronaut_libraries/service/networking/add_post/add_post.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'states.dart';

class AddPostCubit extends Cubit<AddPostState> {
  AddPostCubit() : super(AddPostInitial());
  File? image;
  addPostCubit({
    String? description,
    String? gitHubUrl,
    String? pubDevUrl,
  }) async {
    if (description != '' || image != null) {
      emit(AddPostLoadingState());
      await addPost(
        description: description,
        image: image,
        gitHubUrl: gitHubUrl,
        pubDevUrl: pubDevUrl,
      );
      emit(AddPostSucssesState());
    } else {
      emit(AddPostErrorState());
    }
  }

  selectImagePost() async {
    image = await getImagePicker();
    emit(AddPostSelectedImageState());
  }
}
