import 'package:astronaut_libraries/service/local/shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<bool> signOut() async {
  await clearSharedPreferences().then((value) async {
    if (value = true) {
      try {
        await FirebaseAuth.instance.signOut();
        return true;
      } catch (e) {
        print('Sign out : $e');
      }
    }
  });
  return false;
}
