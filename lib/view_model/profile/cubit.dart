import 'package:astronaut_libraries/service/local/shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'states.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  String? image;
  String? name;
  getProfileData() async {
    emit(ProfileLoadingState());
    image = await getSharedPreferences('image');
    name = await getSharedPreferences('name');
    emit(ProfileSuccsesState());
  }
}
