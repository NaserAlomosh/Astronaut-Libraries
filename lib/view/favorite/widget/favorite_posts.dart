import 'package:astronaut_libraries/classes/show_dailog/show_dailog.dart';
import 'package:astronaut_libraries/view_model/favorite/cubit.dart';
import 'package:astronaut_libraries/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:readmore/readmore.dart';

import '../../../widget/custom_icon.dart';
import '../../../widget/share_icon.dart';
import '../../../widget/two_button.dart';

class FavoritePosts extends StatelessWidget {
  const FavoritePosts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteCubit()..getFavoriteCubit(),
      child: BlocConsumer<FavoriteCubit, FavoriteState>(
        listener: (context, state) {},
        builder: (context, state) {
          var data = context.read<FavoriteCubit>().postModel;
          if (state is FavoriteLoading) {
            return Center(
              child: Lottie.asset('assets/loading.json'),
            );
          } else {
            return RefreshIndicator(
              onRefresh: () async {
                await context.read<FavoriteCubit>().getFavoriteCubit();
              },
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Column(
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
                                  backgroundImage:
                                      NetworkImage(data[index].userImage!),
                                ),
                                SizedBox(width: 10.w),
                                CustomText(
                                  text: data[index].name!,
                                  fontsize: 16,
                                  textfield: true,
                                ),
                              ],
                            ),
                            InkWell(
                              borderRadius: BorderRadius.circular(20.sp),
                              onTap: () async {
                                CustomShowDailog().showDailog(
                                    context: context,
                                    okOnTap: () async {
                                      Get.back();
                                      await context
                                          .read<FavoriteCubit>()
                                          .removeAndAddFavoritePostCubit(
                                            postId: data[index].postId,
                                            userPostId: data[index].userId,
                                          );
                                    },
                                    description: 'description',
                                    title: 'title');
                              },
                              child: const CustomIcons(
                                icon: Icons.bookmark,
                                size: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: SizedBox(
                          width: double.infinity,
                          child: Image.network(
                            data[index].image!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 4.h),
                      SizedBox(height: 5.h),
                      data[index].description != ""
                          ? Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 5.w,
                              ),
                              child: CustomText(
                                text: data[index].name!,
                                fontsize: 18,
                                textfield: true,
                              ),
                            )
                          : const SizedBox(),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: ReadMoreText(
                          data[index].description!,
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 14.sp),
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
                              onTap: () {},
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                    ],
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
