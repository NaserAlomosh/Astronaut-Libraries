import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../model/message/message.dart';
import '../../../local/shared_preferences/shared_preferences.dart';

Future<List<MassegesModel>> getMessagesStream({
  required String userID,
}) async {
  String id = getSharedPreferences('id');
  List<MassegesModel> messages = [];

  FirebaseFirestore.instance
      .collection('users')
      .doc(id)
      .collection('chats')
      .doc(userID)
      .collection('massege')
      .snapshots()
      .listen((QuerySnapshot<Map<String, dynamic>> querySnapshot) {
    for (var element in querySnapshot.docs) {
      messages.add(MassegesModel.fromJosn(element.data()));
    }
  });

  return messages;
}
