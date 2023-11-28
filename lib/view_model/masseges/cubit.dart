import 'package:astronaut_libraries/model/message/message.dart';
import 'package:astronaut_libraries/service/local/shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'state.dart';

List<MassegesModel> massege = [];

class MassegesCubit extends Cubit<MassegesState> {
  MassegesCubit() : super(MassegesInitial());
  // List<MassegesModel> massege = [];

  void getMassegesCubit({required String userID}) async {
    String id = getSharedPreferences('id');
    try {
      FirebaseFirestore.instance
          .collection('users')
          .doc(id)
          .collection('chats')
          .doc(userID)
          .collection('massege')
          .orderBy('date', descending: false)
          .snapshots()
          .listen((event) {
        massege = [];
        for (var element in event.docs) {
          massege.add(MassegesModel.fromJosn(element.data()));
          emit(MassegesSucsses());
        }
      });
    } catch (e) {
      print('ERROR IN VIEW MODLE (MASSEGES CUBIT)');
    }
  }
}
