import 'package:flutter_bloc/flutter_bloc.dart';

import 'states.dart';

class SelectTybeCubit extends Cubit<SelectTybeStates> {
  SelectTybeCubit() : super(SelectTybeInitStates());
  String? selectedTybe;
  dynamic selectFromBox(String tybe) {
    selectedTybe = tybe;
    emit(SelectTybeSuccessState());
    return selectedTybe;
  }
}
