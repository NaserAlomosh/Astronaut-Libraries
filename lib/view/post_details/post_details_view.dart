import 'package:astronaut_libraries/view_model/detalis_post/cubit.dart';
import 'package:astronaut_libraries/view_model/detalis_post/states.dart';
import 'package:astronaut_libraries/widget/custom_icon.dart';
import 'package:astronaut_libraries/widget/custom_text.dart';
import 'package:astronaut_libraries/widget/like_icon.dart';
import 'package:astronaut_libraries/widget/share_icon.dart';
import 'package:astronaut_libraries/widget/two_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:readmore/readmore.dart';

import '../../classes/navigation/app_navigation.dart';
import '../search_user/search_user.dart';

class PostDetailsView extends StatelessWidget {
  final String image;
  final String profileImage;
  final String datePost;
  final String postId;
  final String postUserId;
  final String name;
  const PostDetailsView({
    super.key,
    required this.image,
    required this.profileImage,
    required this.datePost,
    required this.postId,
    required this.postUserId,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(4),
            child: InkWell(
              borderRadius: BorderRadius.circular(30.w),
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Stack(
                children: [
                  SizedBox(
                    height: 40,
                    width: 40,
                    child: Lottie.asset(
                      'assets/back_icon.json',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    color: Colors.black.withOpacity(0.4),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: BlocProvider(
          create: (context) => DetalisPostCubit()
            ..getDetalisPostCubit(userId: postUserId, postId: postId)
            ..userLiked(userId: postUserId, postId: postId)
            ..userSaved(userId: postUserId, postId: postId),
          child: BlocConsumer<DetalisPostCubit, DetalisPostState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is DetalisPostLoading) {
                return Center(
                  child: LottieBuilder.asset('assets/loading.json'),
                );
              } else {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.w,
                          vertical: 10.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 18.sp,
                                  backgroundImage: NetworkImage(
                                    profileImage,
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                CustomText(
                                  text: name,
                                  fontsize: 16,
                                  textfield: true,
                                ),
                              ],
                            ),
                            InkWell(
                              borderRadius: BorderRadius.circular(20.sp),
                              onTap: () async {
                                if (context.read<DetalisPostCubit>().isSaved) {
                                  await context
                                      .read<DetalisPostCubit>()
                                      .removeFavoriteCubit(
                                        postId: postId,
                                        userId: postUserId,
                                      );
                                } else {
                                  await context
                                      .read<DetalisPostCubit>()
                                      .addFavoriteCubit(
                                        description: context
                                            .read<DetalisPostCubit>()
                                            .postDetailsModel!
                                            .description,
                                        image: image,
                                        name: name,
                                        postId: postId,
                                        userId: postUserId,
                                        userImage: profileImage,
                                      );
                                }
                              },
                              child: BlocConsumer<DetalisPostCubit,
                                  DetalisPostState>(
                                listener: (context, state) {},
                                builder: (context, state) {
                                  return CustomIcons(
                                    icon:
                                        context.read<DetalisPostCubit>().isSaved
                                            ? Icons.bookmark
                                            : Icons.bookmark_border,
                                    color: Colors.white,
                                    size: 25,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: SizedBox(
                          width: double.infinity,
                          child: Image.network(
                            image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 4.h),
                      // like cubit
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              LikeIcon(
                                likes: context
                                    .read<DetalisPostCubit>()
                                    .postDetailsModel!
                                    .likes!
                                    .length,
                                userLike: context
                                    .read<DetalisPostCubit>()
                                    .userIsLiked,
                                removeLike: () async => await context
                                    .read<DetalisPostCubit>()
                                    .removeLikeCubit(postId, postUserId),
                                addLike: () async => context
                                    .read<DetalisPostCubit>()
                                    .sendLikeCubit(postId, postUserId),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 5.h),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.w,
                        ),
                        child: CustomText(
                          text: name,
                          fontsize: 18,
                          textfield: true,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: ReadMoreText(
                          context
                              .read<DetalisPostCubit>()
                              .postDetailsModel!
                              .description
                              .toString(),
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 14.sp,
                          ),
                          trimLines: 2,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: ' Show more',
                          trimExpandedText: ' Show less',
                          moreStyle: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.blueAccent,
                          ),
                          lessStyle: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: CustomText(
                          text: datePost,
                          fontsize: 14,
                          textfield: true,
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.w,
                          vertical: 5.h,
                        ),
                        child: const CustomText(
                          text: 'View all 100 coments',
                          fontsize: 18,
                          textfield: true,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTwoButton(
                            firstColor: Colors.blue,
                            firstIcon: FontAwesomeIcons.deviantart,
                            firstOnTap: () {},
                            firstTitle: 'pub.dev',
                            lastColor: Colors.white,
                            lastIcon: FontAwesomeIcons.github,
                            lastOnTap: () {},
                            startAlin: true,
                            lastTitle: 'github',
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 5.h,
                            ),
                            child: ShareIcon(
                              onTap: () {
                                AppNavigation().pushDownToUp(
                                    context,
                                    SearchUser(
                                      pubDevUrl: context
                                          .read<DetalisPostCubit>()
                                          .postDetailsModel!
                                          .pubDevUrl
                                          .toString(),
                                      gitHubUrl: context
                                          .read<DetalisPostCubit>()
                                          .postDetailsModel!
                                          .gitHubUrl
                                          .toString(),
                                      datePost: datePost,
                                      description: context
                                          .read<DetalisPostCubit>()
                                          .postDetailsModel!
                                          .description
                                          .toString(),
                                      likeNumber: context
                                          .read<DetalisPostCubit>()
                                          .postDetailsModel!
                                          .likes!
                                          .length,
                                      postId: postId,
                                      postImage: image,
                                      postUserId: postUserId,
                                      profileImage: profileImage,
                                      searchPage: false,
                                    ));
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
