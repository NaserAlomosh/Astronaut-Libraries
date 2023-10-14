import 'package:astronaut_libraries/database/networking/get_user_data/get_user_data.dart';

import 'package:firebase_auth/firebase_auth.dart';

Future<String> signIn({
  required String email,
  required String password,
}) async {
  //
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      saveOnSheredPrefUserData(id: value.user!.uid);
    });
    return 'Sucsses';
  } on FirebaseAuthException catch (e) {
    return e.code;
  }

  //
}
