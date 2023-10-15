import 'package:astronaut_libraries/view_model/home/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({this.selectedIndex = 0}) : super(HomeInitialState());
  int selectedIndex;
  changeScreen(int? index) {
    selectedIndex = index!;
    print(selectedIndex);
    emit(HomeSuccessesState());
  }
}
