import 'dart:io';

import 'package:astronaut_libraries/classes/select_image_from_device/select_image.dart';
import 'package:astronaut_libraries/constant/string/admin_information.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../classes/cheak_is_not_null_value/cheak_is_not_null_value.dart';
import '../../classes/cheak_tow_textfiald/cheak_tow_textfiald.dart';
import '../../database/networking/add_library/add_library.dart';
import 'states.dart';

class AddLibraryCubit extends Cubit<AddLibraryState> {
  AddLibraryCubit() : super(AddLibraryInitial());
  File? image;
  bool? confirmNameWidgetCheak;
  void addLibrary({
    required String? name,
    required String? confirmName,
    required String? gitHubUrl,
    required String? pubDevUrl,
    required String? type,
    required String? description,
    required String? adminPassword,
  }) async {
    if (isNotValue(name)) {
      emit(AddLibraryNameErrorState());
    } else if (isNotValue(image)) {
      emit(AddLibraryNameErrorState());
    } else if (confirmName != name) {
      emit(AddLibraryNameErrorState());
    } else if (isNotValue(confirmName)) {
      emit(AddLibraryNameErrorState());
    } else if (isNotValue(gitHubUrl)) {
      emit(AddGitHubUrlErrorState());
    } else if (isNotValue(pubDevUrl)) {
      emit(AddPubDevUrlErrorState());
    } else if (adminPassword != ADMIN_PASSWORD) {
      emit(AdminPasswordErrorState());
    } else if (image == null) {
      emit(AddImageErrorState());
    } else if (isNotValue(type)) {
      emit(AddTypeErrorState());
    } else {
      emit(AddLibraryLoadingState());
      await addNewLibrary(
          name: name,
          image: image,
          gitHubUrl: gitHubUrl,
          pubDevUrl: pubDevUrl,
          type: type,
          description: description);

      emit(AddLibrarySucssesState());
    }
  }

  seletImage() async {
    emit(AddLibraryLoadingState());
    await getImagePicker().then((value) {
      image = value;
      emit(SelectedImageSucsses());
    });
  }

  void cheakTextFiald(String? text, String? confirmText) {
    confirmNameWidgetCheak = cheakTowTextfiald(text, confirmText);
    emit(AddLibraryNameErrorState());
  }
}
