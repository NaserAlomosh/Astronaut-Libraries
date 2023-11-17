import 'package:astronaut_libraries/service/local/shared_preferences/shared_preferences.dart';
import 'package:astronaut_libraries/view_model/posts_home/cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../view_model/get_posts_profile/cubit.dart';
import '../get_posts_home/get_posts_home.dart';

Future<void> signOut() async {
  await clearSharedPreferences().then((value) async {
    if (value = true) {
      try {
        await FirebaseAuth.instance.signOut().then((value) {
          postsProfile = null;
          postsCount = 4;
          postsModel = null;
          print('SIGN OUT SUCSSES');
        });
      } catch (e) {
        print('SIGN OUT : $e');
      }
    }
  });
}
