import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../model/library/library.dart';

Future<List<LibraryModel>> getLibrary(
  String collection,
) async {
  List<LibraryModel> data = [];
  await FirebaseFirestore.instance.collection(collection).get().then((value) {
    for (var element in value.docs) {
      data.add(LibraryModel.fromJosn(element.data()));
    }
  }).catchError((onError) {
    log('Burgers DONT GET DATA');
  });
  return data;
}
