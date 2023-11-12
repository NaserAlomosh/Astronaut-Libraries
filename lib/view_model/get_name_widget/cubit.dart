import 'package:astronaut_libraries/service/networking/sign_out/sign_out.dart';
import 'package:astronaut_libraries/view_model/post_home/cubit.dart';
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

  Future<bool?> signOutCubit() async {
    bool? state = await signOut();
    postsModel = null;
    return state;
  }
}
