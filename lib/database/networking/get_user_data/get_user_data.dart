import 'package:astronaut_libraries/database/local/shared_preferences/shared_preferences.dart';
import 'package:astronaut_libraries/model/user_data/user_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> getUserData({required String id}) async {
  //
  //  List<UserModel> userModel = [];
  await FirebaseFirestore.instance
      .collection('users')
      .doc(id)
      .get()
      .then((value) {
    var userModel = UserModel.fromJosn(value.data()!);
    setSharedPreferences('name', userModel.name);
    setSharedPreferences('email', userModel.email);
    setSharedPreferences('phone', userModel.phone);
    setSharedPreferences('image', userModel.image);
    setSharedPreferences('id', userModel.id);
  });
}
