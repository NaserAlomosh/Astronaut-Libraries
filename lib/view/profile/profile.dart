import 'package:astronaut_libraries/classes/navigation/app_navigation.dart';
import 'package:astronaut_libraries/classes/calculatePublishingTime/calculate_publishing_time.dart';
import 'package:astronaut_libraries/view/post_details/post_details_view.dart';
import 'package:astronaut_libraries/view_model/get_posts_profile/cubit.dart';
import 'package:astronaut_libraries/view_model/get_posts_profile/states.dart';
import 'package:astronaut_libraries/view_model/profile/cubit.dart';
import 'package:astronaut_libraries/widget/custom_text.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../view_model/profile/states.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..getProfileData(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: 20.h),
              Center(
                child: CircleAvatar(
                  radius: 40.sp,
                  backgroundColor: Colors.transparent,
                  backgroundImage: context.read<ProfileCubit>().image == null
                      ? null
                      : NetworkImage(
                          context.read<ProfileCubit>().image.toString(),
                        ),
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                context.read<ProfileCubit>().name.toString(),
                style: TextStyle(fontSize: 18.sp),
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: ContainedTabBarView(
                  tabs: const [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                            text: 'Posts', fontsize: 12, textfield: true),
                      ],
                    ),
                  ],
                  views: [
                    builderPostsWidget(context,
                        context.read<ProfileCubit>().image.toString(), null),
                  ],
                  tabBarProperties: TabBarProperties(
                    height: 50.h,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.w),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

Widget builderPostsWidget(
  BuildContext context,
  String? profileImage,
  String? userId,
) {
  return BlocProvider(
    create: (context) => GetPostsProfileCubit()..getPostsProfileCubit(userId),
    child: BlocConsumer<GetPostsProfileCubit, GetPostsProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (postsProfile == null) {
          return Center(
            child: Lottie.asset('assets/loading.json'),
          );
        } else {
          return SingleChildScrollView(
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
              crossAxisCount: 3,
              children: List.generate(
                postsProfile!.length,
                (index) => SizedBox(
                  child: Column(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            AppNavigation().pushZoom(
                              context,
                              PostDetailsView(
                                name: postsProfile![index].name.toString(),
                                postUserId:
                                    postsProfile![index].userId.toString(),
                                postId: postsProfile![index].postId.toString(),
                                datePost: postsTime(
                                    postsProfile![index].shareTime.toString()),
                                profileImage: profileImage!,
                                image: postsProfile![index].image!,
                              ),
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            color: Colors.white10,
                            child: Image.network(
                              postsProfile![index].image!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    ),
  );
}
