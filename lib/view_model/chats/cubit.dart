import 'package:astronaut_libraries/view_model/chats/states.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/user_data/user_data.dart';
import '../../service/local/shared_preferences/shared_preferences.dart';

class ChatsCubit extends Cubit<ChatsState> {
  List<UserModel> chats = [];
  ChatsCubit() : super(ChatsInitial());
  Future<List<UserModel>> getChatsCubit() async {
    String id = getSharedPreferences('id');
    FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .collection('chats')
        .orderBy('dateTime', descending: true)
        .snapshots()
        .listen((QuerySnapshot<Map<String, dynamic>> snapshot) {
      chats = [];
      for (var element in snapshot.docs) {
        // Access data from the document using element.data()
        // For example, assuming UserModel.fromJson is a factory constructor
        // that creates a UserModel object from a Map<String, dynamic>.
        UserModel user = UserModel.fromJson(element.data());
        chats.add(user);
        emit(ChatsSucssesState());
      }

      // Now userModel contains a list of UserModel objects from the documents.
      // You can use it as needed.
    });
    return chats;
  }
}
