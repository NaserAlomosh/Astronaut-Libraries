import 'package:astronaut_libraries/view_model/direct/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DirectCubit extends Cubit<DirectState> {
  DirectCubit() : super(DirectInitial());
  getChatsCubit() async {
    //List chats = await getChats();
  }
}
