import 'package:astronaut_libraries/service/networking/get_user_data/get_user_data.dart';

import 'package:firebase_auth/firebase_auth.dart';

Future<String> signIn({
  required String email,
  required String password,
}) async {
  //
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) async {
      await saveOnSheredPrefUserData(id: value.user!.uid);
    });
    return 'Sign In Sucsses';
  } on FirebaseAuthException catch (e) {
    return e.code;
  }
  //
}
