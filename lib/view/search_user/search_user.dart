import 'package:astronaut_libraries/view_model/search_user/cubit.dart';
import 'package:astronaut_libraries/widget/custom_text.dart';
import 'package:astronaut_libraries/widget/text_fiald_add_new.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../view_model/search_user/states.dart';

class SearchUser extends StatefulWidget {
  const SearchUser({super.key});

  @override
  State<SearchUser> createState() => _SearchUserState();
}

class _SearchUserState extends State<SearchUser> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => SearchUserCubit()..getUserss(),
        child: Column(
          children: [
            BlocConsumer<SearchUserCubit, SearchUserState>(
              listener: (context, state) {},
              builder: (context, state) {
                return AddTextFiald(
                  controller: controller,
                  hintText: 'hintText',
                  onChanged: (_) {
                    print(controller.text);
                    context
                        .read<SearchUserCubit>()
                        .searchUser(searchName: controller.text);
                  },
                  sucsses: false,
                );
              },
            ),
            Expanded(
              child: BlocConsumer<SearchUserCubit, SearchUserState>(
                listener: (context, state) {},
                builder: (context, state) {
                  var data = context.read<SearchUserCubit>().searchList;
                  if (state is SearchUserLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return controller.text == ''
                        ? Stack(
                            children: [
                              Center(
                                child: Lottie.asset('assets/search.json'),
                              ),
                              Container(
                                height: double.infinity,
                                width: double.infinity,
                                color: Colors.black.withOpacity(0.7),
                              ),
                            ],
                          )
                        : Padding(
                            padding: EdgeInsets.only(top: 10.h),
                            child: ListView.builder(
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.w),
                                  child: ListTile(
                                    onTap: () {},
                                    leading: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(50.sp),
                                      child: Image.network(
                                        data[index].image.toString(),
                                        fit: BoxFit.cover,
                                        height: 40.h,
                                        width: 40.w,
                                      ),
                                    ),
                                    title: CustomText(
                                      textfield: true,
                                      text: data[index].name.toString(),
                                      fontsize: 14,
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
