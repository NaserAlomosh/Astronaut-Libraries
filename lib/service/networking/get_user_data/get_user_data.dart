import 'package:astronaut_libraries/service/local/shared_preferences/shared_preferences.dart';
import 'package:astronaut_libraries/model/user_data/user_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> saveOnSheredPrefUserData({required String id}) async {
  try {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .get()
        .then((value) {
      var userModel = UserModel.fromJson(value.data()!);
      setSharedPreferences('name', userModel.name.toString());
      setSharedPreferences('email', userModel.email.toString());
      setSharedPreferences('phone', userModel.phone.toString());
      setSharedPreferences('image', userModel.image.toString());
      setSharedPreferences('id', userModel.id.toString());
    });
  } catch (e) {
    print('Save On Shered PrefUserData : $e');
  }
}
