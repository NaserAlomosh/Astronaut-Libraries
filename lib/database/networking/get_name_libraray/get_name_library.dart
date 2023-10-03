import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../model/name_library/name_library.dart';

Future<List<NameLibraryModel>> getLibraryName() async {
  List<NameLibraryModel> libraryName = [];
  await FirebaseFirestore.instance.collection('lib_name').get().then((value) {
    for (var element in value.docs) {
      libraryName.add(NameLibraryModel.fromJosn(element.data()));
    }
  });
  return libraryName;
}
