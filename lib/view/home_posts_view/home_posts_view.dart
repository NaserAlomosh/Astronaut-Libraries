import 'package:astronaut_libraries/classes/calculatePublishingTime/calculate_publishing_time.dart';
import 'package:astronaut_libraries/classes/navigation/app_navigation.dart';
import 'package:astronaut_libraries/service/networking/get_posts_home/get_posts_home.dart';
import 'package:astronaut_libraries/view/post_details/post_details_view.dart';
import 'package:astronaut_libraries/view_model/posts_home/cubit.dart';
import 'package:astronaut_libraries/view_model/posts_home/states.dart';
import 'package:astronaut_libraries/widget/custom_text.dart';
import 'package:astronaut_libraries/widget/custom_text_buttom.dart';
import 'package:astronaut_libraries/widget/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:readmore/readmore.dart';

class HomePostsView extends StatefulWidget {
  const HomePostsView({super.key});

  @override
  State<HomePostsView> createState() => _HomePostsViewState();
}

class _HomePostsViewState extends State<HomePostsView> {
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      key: const PageStorageKey<String>('posts_home'),
      create: (context) => PostHomeCubit()..getPostHomeCubit(),
      child: BlocConsumer<PostHomeCubit, PostHomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (postsModel == null) {
            return Center(
              child: Lottie.asset('assets/loading.json'),
            );
          } else {
            return postsModel!.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CustomText(text: 'No Posts', fontsize: 30),
                        IconButton(
                            onPressed: () {
                              // postsModel = null;
                              context.read<PostHomeCubit>().getPostHomeCubit();
                            },
                            icon: const Icon(
                              Icons.refresh,
                              color: Colors.white,
                            ))
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RefreshIndicator(
                      strokeWidth: RefreshProgressIndicator.defaultStrokeWidth,
                      color: Colors.grey,
                      backgroundColor: Colors.white10,
                      triggerMode: RefreshIndicatorTriggerMode.anywhere,
                      onRefresh: () async {
                        postsModel = null;
                        await context.read<PostHomeCubit>().getPostHomeCubit();
                      },
                      child: ListView(
                        controller: scrollController,
                        physics: const BouncingScrollPhysics(
                            parent: PageScrollPhysics()),
                        children: [
                          GridView.count(
                            key: const PageStorageKey<String>('posts_home'),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5,
                            crossAxisCount: 1,
                            children: List.generate(
                              postsCount,
                              (index) {
                                return InkWell(
                                  onTap: () {
                                    AppNavigation().pushDownToUp(
                                      context,
                                      PostDetailsView(
                                        image: postsModel![index].image!,
                                        profileImage:
                                            postsModel![index].userImage!,
                                        datePost: postsTime(
                                            postsModel![index].shareTime!),
                                        postId: postsModel![index].postId!,
                                        postUserId: postsModel![index].userId!,
                                        name: postsModel![index].name!,
                                      ),
                                    );
                                  },
                                  child: Column(
                                    key: const PageStorageKey<String>(
                                        'posts_home'),
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            CircleAvatar(
                                              radius: 20.sp,
                                              backgroundImage: NetworkImage(
                                                postsModel![index].userImage!,
                                              ),
                                            ),
                                            SizedBox(width: 5.w),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CustomText(
                                                  text:
                                                      postsModel![index].name!,
                                                  fontsize: 16,
                                                  textfield: true,
                                                ),
                                                CustomText(
                                                  text: postsTime(
                                                      postsModel![index]
                                                          .shareTime!),
                                                  fontsize: 10,
                                                  textfield: true,
                                                  color: const Color.fromARGB(
                                                      10, 255, 255, 255),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      postsModel![index].description == ''
                                          ? const SizedBox()
                                          : IgnorePointer(
                                              ignoring: true,
                                              child: ReadMoreText(
                                                postsModel![index].description!,
                                                style: TextStyle(
                                                  color: Colors.white
                                                      .withOpacity(0.8),
                                                  fontSize: 14.sp,
                                                ),
                                                callback: (val) {},
                                                trimLines: 1,
                                                trimMode: TrimMode.Length,
                                                trimCollapsedText: 'Show more',
                                                trimExpandedText: 'Show less',
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
                                      SizedBox(height: 5.h),
                                      Expanded(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(4.sp),
                                          child: Container(
                                            color: Colors.grey,
                                            width: double.infinity,
                                            child: Image.network(
                                              postsModel![index]
                                                  .image
                                                  .toString(),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          Opacity(
                            opacity: 0.5,
                            child: BlocConsumer<PostHomeCubit, PostHomeState>(
                              listener: (context, state) {
                                if (state is PostHomeNoMore) {
                                  AppSnackBar.animatedSnackBar(
                                      context: context, text: 'text');
                                }
                              },
                              builder: (context, state) {
                                return context.read<PostHomeCubit>().showMore!
                                    ? CustomTextButton(
                                        onPressed: () {
                                          context
                                              .read<PostHomeCubit>()
                                              .showMorePosts();
                                        },
                                        label: 'Show More',
                                      )
                                    : const SizedBox();
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  );
          }
        },
      ),
    );
  }
}
