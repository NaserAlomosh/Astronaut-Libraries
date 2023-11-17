import 'package:flutter_bloc/flutter_bloc.dart';

import '../../service/networking/get_name_widget/get_name_widget.dart';
import '../../model/name_widget/name_widget.dart';
import 'states.dart';

class DrawerCubit extends Cubit<DrawerState> {
  DrawerCubit() : super(DrawerInitial());
  List<NameWidgetModel> nameWidgets = [];

  getWidgetNameCubit() async {
    emit(DrawerLoadingState());
    nameWidgets = await getWidgetName();
    emit(DrawerSucssesState());
  }
}
