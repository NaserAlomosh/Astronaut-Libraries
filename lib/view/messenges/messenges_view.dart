import 'package:astronaut_libraries/service/local/shared_preferences/shared_preferences.dart';
import 'package:astronaut_libraries/view_model/masseges/masseges_cubit.dart';
import 'package:astronaut_libraries/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../service/networking/chats/send_massege/send_massege.dart';
import '../../view_model/masseges/masseges_state.dart';

class MassegesView extends StatefulWidget {
  final String name;

  final String image;

  final String userID;

  const MassegesView({
    super.key,
    required this.name,
    required this.image,
    required this.userID,
  });

  @override
  State<MassegesView> createState() => _MassegesViewState();
}

class _MassegesViewState extends State<MassegesView> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(widget.image),
              ),
              SizedBox(width: 10.h),
              CustomText(
                textfield: true,
                text: widget.name,
                fontsize: 14,
              )
            ],
          ),
        ),
        body: BlocProvider(
          create: (context) =>
              MassegesCubit()..getMassegesCubit(userID: widget.userID),
          child: BlocConsumer<MassegesCubit, MassegesState>(
            listener: (context, state) {},
            builder: (context, state) {
              String id = getSharedPreferences('id');
              return SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 1.2,
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: massege.length,
                          itemBuilder: (context, index) => massege[index]
                                      .senderID !=
                                  id
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: Align(
                                    alignment: AlignmentDirectional.centerStart,
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.blueGrey,
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(10),
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CustomText(
                                          text: massege[index].text!,
                                          fontsize: 14,
                                          textfield: true,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 10,
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional.centerEnd,
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.blueAccent,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CustomText(
                                          text: massege[index].text!,
                                          fontsize: 14,
                                          textfield: true,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: controller,
                              decoration: const InputDecoration(
                                  hintText: 'enter your massege',
                                  hintStyle: TextStyle(color: Colors.white)),
                            ),
                          ),
                          IconButton(
                              color: Colors.amber,
                              onPressed: () async {
                                await sendMassege(
                                  receiverID: widget.userID,
                                  text: controller.text,
                                );
                                controller.text = '';
                              },
                              icon: const Icon(Icons.send)),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }
}
