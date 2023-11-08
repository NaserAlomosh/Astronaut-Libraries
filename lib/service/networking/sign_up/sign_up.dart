import 'package:astronaut_libraries/service/local/shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> signUp({
  required String firstName,
  required String lastName,
  required int phone,
  required String email,
  required String password,
  String image = "",
}) async {
  //
  await FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email, password: password)
      .then((value) async {
    value.credential;
    String uid = FirebaseAuth.instance.currentUser!.uid.toString();
    FirebaseFirestore.instance.collection("users").doc(uid).set({
      "uid": uid,
      "email": email,
      "name": '$firstName $lastName',
      "image": image,
      "phone": phone,
    });
  }).then((a) async {
    await setSharedPreferences('name', '$firstName $lastName');
    await setSharedPreferences('email', email);
    await setSharedPreferences('phone', phone.toString());
    await setSharedPreferences('image', image);
  }).catchError((onError) {
    print(onError);
  });
  //
}
