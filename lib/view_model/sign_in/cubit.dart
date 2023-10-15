import 'package:astronaut_libraries/service/networking/sign_in/sign_in.dart';
import 'package:astronaut_libraries/view_model/sign_up/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'states.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());
  signInCubit({String? email, String? password}) async {
    if (email != '' && password != '') {
      emit(SignInLoadingState());
      if (containsBothCharactersAndNumbers(password!)) {
        var state = await signIn(email: email!, password: password);
        if (state == 'Sign In Sucsses') {
          emit(SignInSucssesState());
        } else {
          emit(SignInErrorState());
        }
      } else {
        emit(SignInErrorState());
      }
    } else {
      emit(SignInEmailAndPasswordRequiredState());
    }
  }
}
