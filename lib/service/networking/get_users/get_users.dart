import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../model/users_data/users_data.dart';

Future<List<UsersDataModel>> getUsers() async {
  List<UsersDataModel> data = [];

  try {
    await FirebaseFirestore.instance.collection('users').get().then(
      (value) {
        for (var element in value.docs) {
          data.add(UsersDataModel.formJson(element.data()));
        }
        return data;
      },
    );
  } catch (e) {
    print('Get Users Error :$e');
  }
  return data;
}
