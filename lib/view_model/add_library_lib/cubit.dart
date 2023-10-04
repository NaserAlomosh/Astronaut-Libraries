import 'dart:io';

import 'package:astronaut_libraries/classes/select_image_from_device/select_image.dart';
import 'package:astronaut_libraries/view_model/add_name_library/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../classes/cheak_is_not_null_value/cheak_is_not_null_value.dart';
import '../../database/networking/add_library/add_library.dart';
import 'states.dart';

class AddLibraryCubit extends Cubit<AddLibraryState> {
  AddLibraryCubit() : super(AddLibraryInitial());
  File? image;
  void addLibrary({
    required String? name,
    required String? gitHubUrl,
    required String? pubDevUrl,
    required String? type,
  }) async {
    if (isNotValue(name)) {
      emit(AddLibraryNameErrorState());
    } else if (isNotValue(image)) {
      emit(AddImageErrorState());
    } else if (isNotValue(gitHubUrl)) {
      emit(AddGitHubUrlErrorState());
    } else if (isNotValue(pubDevUrl)) {
      emit(AddpubDevUrlErrorState());
    } else if (isNotValue(type)) {
      emit(AddTypeErrorState());
    } else {
      emit(AddLibraryLoadingState());
      addNewLibrary(
        name: name,
        image: image,
        gitHubUrl: gitHubUrl,
        pubDevUrl: pubDevUrl,
        type: type,
      ).then((_) {
        emit(AddLibrarySucssesState());
      });
    }
  }

  seletImage() async {
    emit(AddLibraryLoadingState());
    await getImagePicker().then((value) {
      image = value;
      emit(AddLibrarySucssesState());
    });
  }
}
