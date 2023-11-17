import 'package:astronaut_libraries/view_model/search_user/cubit.dart';
import 'package:astronaut_libraries/widget/custom_text.dart';
import 'package:astronaut_libraries/widget/text_fiald_add_new.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../classes/navigation/app_navigation.dart';
import '../../view_model/search_user/states.dart';
import '../consignee_information/consignee_information.dart';
import '../profile_user/profie_user.dart';

class SearchUser extends StatefulWidget {
  final String? postImage;
  final String? description;
  final String? profileImage;
  final String? datePost;
  final int? likeNumber;
  final String? postId;
  final String? postUserId;
  final String? gitHubUrl;
  final String? pubDevUrl;
  final bool searchPage;

  const SearchUser({
    super.key,
    this.postImage,
    this.description,
    this.profileImage,
    this.datePost,
    this.likeNumber,
    this.postId,
    this.postUserId,
    this.gitHubUrl,
    this.pubDevUrl,
    required this.searchPage,
  });

  @override
  State<SearchUser> createState() => _SearchUserState();
}

class _SearchUserState extends State<SearchUser> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: widget.searchPage ? null : AppBar(),
        body: BlocProvider(
          create: (context) => SearchUserCubit()..getUserss(),
          child: Column(
            children: [
              BlocConsumer<SearchUserCubit, SearchUserState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return AddTextFiald(
                    controller: controller,
                    hintText: 'Search',
                    onChanged: (_) {
                      print(controller.text);
                      context
                          .read<SearchUserCubit>()
                          .searchUser(searchName: controller.text);
                    },
                    sucsses: true,
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
                                      onTap: () {
                                        widget.searchPage
                                            ? AppNavigation().pushDownToUp(
                                                context,
                                                ProfileUser(
                                                  image: data[index]
                                                      .image
                                                      .toString(),
                                                  id: data[index].id,
                                                  name: data[index].name,
                                                ),
                                              )
                                            : AppNavigation().pushDownToUp(
                                                context,
                                                ConsigneeInformation(
                                                  pubDevUrl: widget.pubDevUrl!,
                                                  gitHubUrl: widget.gitHubUrl!,
                                                  datePost: widget.datePost!,
                                                  description:
                                                      widget.description!,
                                                  likeNumber:
                                                      widget.likeNumber!,
                                                  postId: widget.postId!,
                                                  postImage: widget.postImage!,
                                                  postUserId:
                                                      widget.postUserId!,
                                                  profileImage:
                                                      widget.profileImage!,
                                                  image: data[index].image,
                                                  name: data[index].name,
                                                  id: data[index].id,
                                                ),
                                              );
                                      },
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
      ),
    );
  }
}
