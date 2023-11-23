import 'package:astronaut_libraries/classes/navigation/app_navigation.dart';
import 'package:astronaut_libraries/view/messenges/messenges_view.dart';
import 'package:astronaut_libraries/view_model/chats/cubit.dart';
import 'package:astronaut_libraries/view_model/chats/states.dart';
import 'package:astronaut_libraries/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => ChatsCubit()..getChatsCubit(),
          child: BlocConsumer<ChatsCubit, ChatsState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is ChatsLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                var chats = context.read<ChatsCubit>().chats;
                return chats.isEmpty
                    ? const Center(
                        child: CustomText(
                          text: 'is Empty',
                          fontsize: 20,
                        ),
                      )
                    : ListView.builder(
                        itemCount: chats.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  AppNavigation().pushZoom(
                                    context,
                                    MassegesView(
                                      image: chats[index].image!,
                                      name: chats[index].name!,
                                      userID: chats[index].id!,
                                    ),
                                  );
                                },
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      chats[index].image!,
                                    ),
                                  ),
                                  title: Text(chats[index].name!),
                                ),
                              ),
                              const Divider(
                                height: 2,
                                color: Colors.grey,
                              ),
                            ],
                          );
                        },
                      );
              }
            },
          ),
        ),
      ),
    );
  }
}
