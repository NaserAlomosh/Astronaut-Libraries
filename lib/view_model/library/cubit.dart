import 'package:flutter_bloc/flutter_bloc.dart';

import '../../service/networking/get_library/get_library.dart';
import '../../model/library/library.dart';
import 'states.dart';

class GetLibraryCubit extends Cubit<GetLibraryState> {
  GetLibraryCubit() : super(GetLibraryInitial());
  List<LibraryModel> librarys = [];
  Future<void> getData(String collection) async {
    emit(GetLibraryLoading());
    librarys = await getLibrary(collection);
    emit(GetLibrarySuccesses());
  }
}
