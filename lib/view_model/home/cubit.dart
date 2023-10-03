// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:widget_flutter_app/model/banners/banners.dart';
// import 'package:widget_flutter_app/view_model/home/states.dart';

// class HomeCubit extends Cubit<HomeState> {
//   List<BannersModel> bannersList = [];

//   HomeCubit() : super(HomeInitialState());
//   Future<void> getBannersData() async {
//     emit(HomeLoadingState());
//     FirebaseFirestore.instance.collection('banners').get().then(
//       (value) {
//         for (var element in value.docs) {
//           bannersList.add(BannersModel.fromJosn(element.data()));
//         }
//         emit(HomeSuccessesState());
//       },
//     );
//   }
// }
