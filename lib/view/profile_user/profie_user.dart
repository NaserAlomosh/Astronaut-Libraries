import 'package:astronaut_libraries/view/profile/profile.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widget/custom_text.dart';

class ProfileUser extends StatelessWidget {
  final String image;

  final String id;
  final String name;
  const ProfileUser(
      {super.key, required this.image, required this.id, required this.name});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 20.h),
            Center(
              child: CircleAvatar(
                radius: 40.sp,
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(image),
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              name,
              style: TextStyle(fontSize: 18.sp),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: ContainedTabBarView(
                  tabs: const [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                            text: 'Posts', fontsize: 12, textfield: true),
                        CustomText(text: '1078', fontsize: 12, textfield: true),
                      ],
                    ),
                  ],
                  views: [
                    builderPostsWidget(context, image, id),
                  ],
                  tabBarProperties: TabBarProperties(
                    height: 50.h,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.w),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}