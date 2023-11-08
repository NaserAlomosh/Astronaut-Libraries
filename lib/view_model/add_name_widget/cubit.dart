import 'package:astronaut_libraries/classes/cheak_tow_textfiald/cheak_tow_textfiald.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../classes/cheak_is_not_null_value/cheak_is_not_null_value.dart';
import '../../constant/string/admin_information.dart';
import '../../service/networking/add_name_widget/add_name_widget.dart';
import '../../service/networking/add_name_widget/check_name_exists.dart';
import '../../service/networking/get_name_widget/get_name_widget.dart';
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
          await addNameWidget(type).then(
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
