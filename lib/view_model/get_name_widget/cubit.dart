import 'package:flutter_bloc/flutter_bloc.dart';

import '../../database/networking/get_name_libraray/get_name_library.dart';
import '../../model/name_widget/name_widget.dart';
import 'states.dart';

class GetNameWidgetCubit extends Cubit<GetNameWidgetState> {
  GetNameWidgetCubit() : super(GetNameWidgetInitial());
  List<NameWidgetModel> nameWidgets = [];

  getName() async {
    emit(GetNameWidgetLoadingState());
    nameWidgets = await getWidgetName();
    emit(GetNameWidgetSucssesState());
  }
}
