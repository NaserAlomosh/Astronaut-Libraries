import 'package:astronaut_libraries/model/user_data/user_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../local/shared_preferences/shared_preferences.dart';

Future<void> sendMassege({
  required String receiverID,
  required String text,
}) async {
  String senderID = getSharedPreferences('id');
  String senderName = getSharedPreferences('name');
  String senderImage = getSharedPreferences('image');
  print('SENDER ID = $senderID');

  var usersCollection = FirebaseFirestore.instance.collection('users');
  try {
    UserModel? receiverData;
    await usersCollection.doc(receiverID).get().then((value) {
      receiverData = UserModel.fromJson(value.data());
    });
    await usersCollection
        .doc(senderID)
        .collection('chats')
        .doc(receiverID)
        .set({
      'name': receiverData!.name,
      'image': receiverData!.image,
      'uid': receiverData!.id,
      'dateTime': DateTime.now(),
    }).then((value) {
      usersCollection
          .doc(senderID)
          .collection('chats')
          .doc(receiverID)
          .collection('massege')
          .add({
        'date': FieldValue.serverTimestamp(),
        'senderID': senderID,
        'receiverID': receiverID,
        'text': text,
      });
    });
    await usersCollection
        .doc(receiverID)
        .collection('chats')
        .doc(senderID)
        .set({
      'name': senderName,
      'image': senderImage,
      'uid': senderID,
      'dateTime': FieldValue.serverTimestamp(),
    }).then((value) {
      usersCollection
          .doc(receiverID)
          .collection('chats')
          .doc(senderID)
          .collection('massege')
          .add({
        'date': FieldValue.serverTimestamp(),
        'senderID': senderID,
        'receiverID': receiverID,
        'text': text,
      });
    });
    // await usersCollection
    //     .doc(receiverID)
    //     .collection('chats')
    //     .doc(senderID)
    //     .set({
    //   'name': senderName,
    //   'uid': senderID,
    //   'image': senderImage,
    //   'dateTime': FieldValue.serverTimestamp(),
    // }).then((value) {
    //   usersCollection
    //       .doc(receiverID)
    //       .collection('chats')
    //       .doc(senderID)
    //       .collection('massege')
    //       .add({
    //     'date': FieldValue.serverTimestamp(),
    //     'senderID': senderID,
    //     'receiverID': receiverID,
    //     'text': text,
    //   });
    // });
    // // ... (similar try-catch for the other Firestore operation)
  } catch (e) {
    print('Firestore Error: $e');
  }
}
