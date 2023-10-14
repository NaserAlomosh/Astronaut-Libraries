import 'package:astronaut_libraries/database/networking/sign_in/sign_in.dart';
import 'package:astronaut_libraries/view_model/sign_up/cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'states.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());
  signInCubit({String? email, String? password}) async {
    if (email != null && password != null) {
      if (containsBothCharactersAndNumbers(password)) {
        emit(SignInLoadingState());
        var state = await signIn(email: email, password: password);
        if (state == 'user-not-found') {
          emit(SignInErrorEmailState());
        } else if (state == 'wrong-password') {
          emit(SignInErrorState());
        } else {
          var currentUser = FirebaseAuth.instance.currentUser;
          print(currentUser!.uid);
          emit(SignInSucssesState());
        }
      } else {
        emit(SignInErrorState());
      }
    }
  }
}
