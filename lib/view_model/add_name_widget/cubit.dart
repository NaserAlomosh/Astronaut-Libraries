import 'package:astronaut_libraries/classes/cheak_tow_textfiald/cheak_tow_textfiald.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../classes/cheak_is_not_null_value/cheak_is_not_null_value.dart';
import '../../constant/string/admin_information.dart';
import '../../database/networking/add_name_library/add_name_library.dart';
import '../../database/networking/add_name_library/check_name_exists.dart';
import '../../database/networking/get_name_libraray/get_name_library.dart';
import 'states.dart';

class AddNameLibraryCubit extends Cubit<AddNameLibraryState> {
  AddNameLibraryCubit() : super(AddNameLibraryInitial());
  bool confirmNameWidgetCheak = false;
  String? typeWidget;
  Future<void> addName({
    String? type,
    String? confirmtype,
    String? adminPassword,
  }) async {
    emit(AddNameLoadingState());

    if (isNotValue(type)) {
      emit(AddNameTypeErrorState());
    } else if (await checkNameExists(type!)) {
      emit(AddNameTybeIsExistsState());
    } else {
      if (cheakTowTextfiald(type, confirmtype)) {
        if (cheakTowTextfiald(ADMIN_PASSWORD, adminPassword)) {
          await addNameLibrary(type).then(
            (value) async {
              await getWidgetName();
              type = typeWidget;
              emit(AddNameSucssesState());
            },
          );
        } else {
          // admin password error
          emit(AddNameAdminPasswordErrorState());
        }
      } else {
        //confirmError
        emit(AddNameTypeErrorState());
      }
    }
  }

  void cheakTextFiald(String? text, String? confirmText) {
    confirmNameWidgetCheak = cheakTowTextfiald(text, confirmText);
    emit(AddNameTypeErrorState());
  }
}
