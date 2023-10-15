import 'package:astronaut_libraries/database/local/shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'states.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  String? image;
  String? name;
  getProfileData() {
    emit(ProfileLoadingState());
    image = getSharedPreferences('image');
    name = getSharedPreferences('name');
    emit(ProfileSuccsesState());
  }
}
