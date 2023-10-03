import 'package:flutter_bloc/flutter_bloc.dart';

import '../../classes/cheak_is_not_null_value/cheak_is_not_null_value.dart';
import '../../database/networking/add_library/add_library.dart';
import 'states.dart';

class AddLibraryCubit extends Cubit<AddNewLibState> {
  AddLibraryCubit() : super(AddNewLibInitial());
  void addLibrary({
    required String? name,
    required String? image,
    required String? gitHubUrl,
    required String? pubDevUrl,
    required String? type,
  }) async {
    if (isNotValue(name)) {
      emit(AddNameErrorState());
    } else if (isNotValue(image)) {
      emit(AddImageErrorState());
    } else if (isNotValue(gitHubUrl)) {
      emit(AddgitHubUrlErrorState());
    } else if (isNotValue(pubDevUrl)) {
      emit(AddpubDevUrlErrorState());
    } else if (isNotValue(type)) {
      emit(AddTypeErrorState());
    } else {
      emit(AddNewLoadingState());
      addNewLibrary(
        name: name,
        image: image,
        gitHubUrl: gitHubUrl,
        pubDevUrl: pubDevUrl,
        type: type,
      ).then((value) {
        emit(AddNewSucssesState());
      });
    }
  }
}
