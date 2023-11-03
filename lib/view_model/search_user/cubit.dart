import 'package:astronaut_libraries/model/users_data/users_data.dart';
import 'package:astronaut_libraries/service/networking/get_users/get_users.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'states.dart';

class SearchUserCubit extends Cubit<SearchUserState> {
  SearchUserCubit() : super(SearchUserInitial());
  List<UsersDataModel> users = [];
  List searchList = [];
  Future getUserss() async {
    await getUsers().then((value) {
      users = value;
    });
  }

  searchUser({String? searchName}) async {
    emit(SearchUserLoadingState());
    List data = [];
    if (searchName != '') {
      emit(SearchUserLoadingState());
      users.where((element) {
        String nameLower = element.name!.toLowerCase();
        if (nameLower.contains(searchName!.toLowerCase())) {
          data.add(element);
        }
        searchList = data;
        emit(SearchUserSuccessState());
        return true;
      }).toList();
    } else {
      searchList = [];
      emit(SearchUserSuccessState());
    }
  }
}
