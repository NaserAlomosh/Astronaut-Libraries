import 'package:astronaut_libraries/classes/navigation/app_navigation.dart';
import 'package:astronaut_libraries/view/posts_details/post_details_view.dart';
import 'package:astronaut_libraries/widget/custom_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(height: 20.h),
        Center(
          child: Center(
            child: SizedBox(
              height: 100,
              width: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          'NASER ALOMOSH',
          style: TextStyle(fontSize: 16.sp),
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
                    CustomText(text: '1078', fontsize: 10, textfield: true),
                    CustomText(text: 'Posts', fontsize: 10, textfield: true)
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(text: '267', fontsize: 10, textfield: true),
                    CustomText(text: 'Followers', fontsize: 10, textfield: true)
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(text: '326', fontsize: 10, textfield: true),
                    CustomText(text: 'Folowing', fontsize: 10, textfield: true)
                  ],
                )
              ],
              views: [
                builderPostsWidget(context),
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
  }
}

Widget builderPostsWidget(BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      children: [
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
          crossAxisCount: 3,
          children: [
            InkWell(
              onTap: () {
                AppNavigation().pushZoom(
                  context,
                  const PostDetailsView(),
                );
              },
              child: CachedNetworkImage(
                height: 100,
                width: 100,
                imageUrl:
                    "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg",
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) =>
                    Lottie.asset('assets/loading.json'),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ],
        ),
      ],
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