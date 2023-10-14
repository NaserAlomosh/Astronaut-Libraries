import 'package:astronaut_libraries/classes/navigation/app_navigation.dart';
import 'package:astronaut_libraries/view/posts_details/post_details_view.dart';
import 'package:astronaut_libraries/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePostsView extends StatefulWidget {
  const HomePostsView({super.key});

  @override
  State<HomePostsView> createState() => _HomePostsViewState();
}

class _HomePostsViewState extends State<HomePostsView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (c, index) {
        return Column(
          children: [
            postsHomePage(
              text:
                  'The first version of Flutter was known as "Sky"[8] and ran on the Android operating system. It was unveiled at the 2015 Dart developer summit[9] with the stated intent of being able to render consistently at 120 frames per second.[10] During the keynote of Google Developer Days in Shanghai in September 2018, Google announced Flutter Release Preview 2, the last major release before Flutter 1.0. On December 4, 2018, Flutter 1.0 was released at the Flutter Live event, denoting the first stable version of the framework. On December 11, 2019, Flutter 1.12 was released at the Flutter Interactive event.[11]On May 6, 2020, the Dart software development kit (SDK) version 2.8 and Flutter 1.17.0 were released, adding support for the Metal API which improves performance on iOS devices by approximately 50%, as well as new Material widgets and network tracking development tools.',
              context,
              onTapShowMore: () {
                AppNavigation().pushZoom(c, const PostDetailsView());
              },
            ),
            const Divider(color: Colors.white),
          ],
        );
      },
      itemCount: 20,
    );
  }
}

Widget postsHomePage(
  BuildContext context, {
  void Function()? onTapShowMore,
  required String text,
}) {
  return SizedBox(
    height: 400.h,
    width: double.infinity,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTapShowMore,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomText(
                            text: 'Naser Alomosh',
                            fontsize: 10.sp,
                            textfield: true,
                          ),
                          CustomText(
                            text: '10h',
                            fontsize: 10.sp,
                            textfield: true,
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            CustomText(
              textfield: true,
              text: '${text.substring(0, 150)}...',
              fontsize: 16.0,
            ),
            TextButton(
              onPressed: onTapShowMore,
              child: const Text('Show More'),
            ),
            SizedBox(height: 5.h),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: Image.network(
                  'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
