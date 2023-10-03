import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> addLibrary({
  required String? name,
  required String? image,
  required String? gitHubUrl,
  required String? pubDevUrl,
  required String? type,
}) async {
  //
  await FirebaseFirestore.instance
      .collection(type!)
      .add({}).then((DocumentReference doc) async {
    await FirebaseFirestore.instance.collection(type).doc(doc.id).set({
      'name': name,
      'image': image,
      'gitHubUrl': gitHubUrl,
      'pubDevUrl': pubDevUrl,
      'type': type,
      'id': doc.id,
    });
  });
}
