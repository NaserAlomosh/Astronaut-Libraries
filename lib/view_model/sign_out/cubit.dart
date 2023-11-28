import 'package:astronaut_libraries/service/local/shared_preferences/shared_preferences.dart';
import 'package:astronaut_libraries/view_model/sign_out/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../service/networking/sign_out/sign_out.dart';

class SignOutCubit extends Cubit<SignOutState> {
  SignOutCubit() : super(SignOutInitial());
  Future signOutCubit() async {
    try {
      await signOut().then((value) async {
        await clearSharedPreferences();
      });
      emit(SignOutSucsses());
      print('SIGN OUT IS');
    } catch (e) {
      print('SIGN OUT IS  ERROR : $e');
    }
  }
}
