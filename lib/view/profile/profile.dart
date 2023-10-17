import 'package:astronaut_libraries/classes/navigation/app_navigation.dart';
import 'package:astronaut_libraries/classes/posts_time_calculation/posts_time_calculation.dart';
import 'package:astronaut_libraries/view/posts_details/post_details_view.dart';
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
                  backgroundImage: NetworkImage(
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
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.transparent,
                  child: ContainedTabBarView(
                    tabs: const [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                              text: '1078', fontsize: 10, textfield: true),
                          CustomText(
                              text: 'Posts', fontsize: 10, textfield: true)
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                              text: '267', fontsize: 10, textfield: true),
                          CustomText(
                              text: 'Followers', fontsize: 10, textfield: true)
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                              text: '326', fontsize: 10, textfield: true),
                          CustomText(
                              text: 'Folowing', fontsize: 10, textfield: true)
                        ],
                      )
                    ],
                    views: [
                      builderPostsWidget(
                        context,
                        context.read<ProfileCubit>().image.toString(),
                      ),
                      builderFolowersWidget(context),
                      builderFolowingWidget(context),
                    ],
                    tabBarProperties: TabBarProperties(
                      height: 50.h,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.w),
                        color: Colors.grey.withOpacity(0.2),
                      ),
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

Widget builderPostsWidget(BuildContext context, String? profileImage) {
  return BlocProvider(
    create: (context) => GetPostsProfileCubit()..getPostsProfileCubit(),
    child: BlocConsumer<GetPostsProfileCubit, GetPostsProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is GetPostsProfileLoading) {
          return Center(
            child: Lottie.asset('assets/loading.json'),
          );
        } else {
          return SingleChildScrollView(
            child: Column(
              children: [
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1,
                  crossAxisCount: 3,
                  children: List.generate(
                    context.read<GetPostsProfileCubit>().postProfile.length,
                    (index) => SizedBox(
                      child: Column(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                AppNavigation().pushZoom(
                                  context,
                                  PostDetailsView(
                                    datePost: postsTimeCalculation(context
                                        .read<GetPostsProfileCubit>()
                                        .postProfile[index]
                                        .shareTime
                                        .toString()),
                                    profileImage: profileImage!,
                                    image: context
                                        .read<GetPostsProfileCubit>()
                                        .postProfile[index]
                                        .image,
                                    description: context
                                        .read<GetPostsProfileCubit>()
                                        .postProfile[index]
                                        .description,
                                  ),
                                );
                              },
                              child: Container(
                                width: double.infinity,
                                color: Colors.white10,
                                child: Image.network(
                                  context
                                      .read<GetPostsProfileCubit>()
                                      .postProfile[index]
                                      .image,
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
              ],
            ),
          );
        }
      },
    ),
  );
}

Widget builderFolowersWidget(BuildContext context) {
  return ListView.builder(
    itemBuilder: (context, index) => Column(
      children: [
        ListTile(
          leading: SizedBox(
            width: 50,
            height: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(200),
              child: Image.network(
                'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: const Text('Naser Alomosh'),
          trailing: Container(
            color: Colors.grey.withOpacity(0.2),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Remove'),
            ),
          ),
        ),
        const Divider(
          height: 20,
          color: Colors.grey,
        ),
      ],
    ),
    itemCount: 30,
  );
}

Widget builderFolowingWidget(BuildContext context) {
  return ListView.builder(
    itemBuilder: (context, index) => Column(
      children: [
        ListTile(
          leading: SizedBox(
            width: 50,
            height: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(200),
              child: Image.network(
                'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: const Text('Naser Alomosh'),
          trailing: Container(
            color: Colors.grey.withOpacity(0.2),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Folowing'),
            ),
          ),
        ),
        const Divider(
          height: 20,
          color: Colors.grey,
        ),
      ],
    ),
    itemCount: 30,
  );
}


// context
//                         .read<GetPostsProfileCubit>()
//                         .postProfile
//                         .map((e) => InkWell(
//                               onTap: () {
//                                 AppNavigation()
//                                     .pushZoom(context, const PostDetailsView());
//                               },
//                               //
//                               child: Image.network(e.toString()),
//                             ))
//                         .toList()