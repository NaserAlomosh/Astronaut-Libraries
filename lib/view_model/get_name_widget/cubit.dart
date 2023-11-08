import 'package:flutter_bloc/flutter_bloc.dart';

import '../../service/networking/get_name_widget/get_name_widget.dart';
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
