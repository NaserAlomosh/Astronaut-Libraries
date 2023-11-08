import 'package:cloud_firestore/cloud_firestore.dart';

Future<bool> checkNameExists(String type) async {
  List<String> oldTybe = [];
  bool cheak = false;
  try {
    await FirebaseFirestore.instance.collection('lib_name').get().then((value) {
      for (var element in value.docs) {
        oldTybe.add(element.id);
      }

      for (var i = 0; i < oldTybe.length; i++) {
        if (type == oldTybe[i]) {
          cheak = true;
        }
      }
    });
  } catch (e) {
    print('Check Name Exists Error : $e');
  }
  return cheak;
}
