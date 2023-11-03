import 'package:astronaut_libraries/model/users_data/users_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'states.dart';

class SearchLibraryCubit extends Cubit<SearchLibraryState> {
  SearchLibraryCubit() : super(SearchLibraryInitial());
  List<UsersDataModel> users = [];
  List searchList = [];
  searchUser({String? searchName}) async {
    if (searchName != '') {
      emit(SearchLibraryLoadingState());
      users.where((element) {
        for (var i = 0; i < users.length; i++) {
          String nameLower = element.name!.toLowerCase();
          if (nameLower.contains(searchName!.toLowerCase())) {
            searchList.add(element);
          }
        }
        emit(SearchLibrarySuccessState());
        return true;
      }).toList();
    }
  }
}
