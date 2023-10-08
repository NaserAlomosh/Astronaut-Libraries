import 'package:astronaut_libraries/classes/cheak_is_not_null_value/cheak_is_not_null_value.dart';
import 'package:astronaut_libraries/database/networking/sign_up/sign_up.dart';
import 'package:astronaut_libraries/view_model/sign_up/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  bool emailCheak = false;
  bool passwordCheak = false;

  Future<void> signUpCubit({
    String? firstName,
    String? lastName,
    int? phone,
    String? email,
    String? image,
    String? password,
  }) async {
    if (isNotValue(firstName)) {
    } else if (isNotValue(lastName)) {
    } else if (isNotValue(phone)) {
    } else if (!isEmail(email!)) {
    } else if (!containsBothCharactersAndNumbers(password!)) {
    } else {
      try {
        emit(SignUpLoadingState());
        await signUp(
          firstName: firstName!,
          lastName: lastName!,
          phone: phone!,
          email: email,
          password: password,
        );
        emit(SignUpSuccessState());
      } catch (_) {
        emit(SignUpErrorState());
      }
    }
  }
}

bool containsBothCharactersAndNumbers(String input) {
  if (input.length >= 6) {
    final pattern = RegExp(r'^(?=.*[a-zA-Z])(?=.*[0-9])');
    return pattern.hasMatch(input);
  } else {
    return false;
  }
}

bool isEmail(String input) {
  final pattern = RegExp(
    r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$',
    caseSensitive: false,
  );

  return pattern.hasMatch(input);
}
