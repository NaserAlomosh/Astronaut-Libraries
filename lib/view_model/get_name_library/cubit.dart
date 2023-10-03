import 'package:flutter_bloc/flutter_bloc.dart';

import '../../database/networking/get_name_libraray/get_name_library.dart';
import '../../model/name_library/name_library.dart';
import 'states.dart';

class GetNameLibraryCubit extends Cubit<GetNameLibraryState> {
  GetNameLibraryCubit() : super(GetNameLibraryInitial());
  List<NameLibraryModel> nameLibrarys = [];

  getName() async {
    emit(GetNameLibraryLoadingState());
    nameLibrarys = await getLibraryName();
    emit(GetNameLibrarySucssesState());
  }
}
