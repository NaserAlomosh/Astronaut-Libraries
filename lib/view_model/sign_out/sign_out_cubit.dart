import 'package:astronaut_libraries/view_model/sign_out/sign_out_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../service/networking/sign_out/sign_out.dart';

class SignOutCubit extends Cubit<SignOutState> {
  SignOutCubit() : super(SignOutInitial());
  Future signOutCubit() async {
    try {
      await signOut();
      emit(SignOutSucsses());
      print('SIGN OUT IS');
    } catch (e) {
      print('SIGN OUT IS  ERROR : $e');
    }
  }
}
