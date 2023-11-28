// import 'package:astronaut_libraries/view_model/chats/cubit.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// import '../../../../model/user_data/user_data.dart';

// // Future<List<UserModel>> getChats({required String id}) async {
// //   FirebaseFirestore.instance
// //       .collection('users')
// //       .doc(id)
// //       .collection('chats')
// //       .orderBy('dateTime', descending: true)
// //       .snapshots()
// //       .listen((QuerySnapshot<Map<String, dynamic>> snapshot) {
// //     for (var element in snapshot.docs) {
// //       // Access data from the document using element.data()
// //       // For example, assuming UserModel.fromJson is a factory constructor
// //       // that creates a UserModel object from a Map<String, dynamic>.
// //       UserModel user = UserModel.fromJson(element.data());
// //       chats.add(user);
// //     }

// //     // Now userModel contains a list of UserModel objects from the documents.
// //     // You can use it as needed.
// //   });
// //   return chats;
// // }
