import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../model/name_widget/name_widget.dart';

Future<List<NameWidgetModel>> getWidgetName() async {
  List<NameWidgetModel> widgetName = [];
  try {
    await FirebaseFirestore.instance
        .collection('lib_name')
        .orderBy('type', descending: false)
        .get()
        .then((value) {
      for (var element in value.docs) {
        widgetName.add(NameWidgetModel.fromJosn(element.data()));
      }
    });
  } catch (e) {
    print('Get Widget Name Error : $e');
  }
  return widgetName;
}
