import 'package:astronaut_libraries/style/color_app.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            body: Lottie.asset('assets/profile.json'),
          ),
          Scaffold(
            appBar: AppBar(),
            backgroundColor: AppColor.scaffoldBackgroundColor.withOpacity(0.6),
            body: Column(
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
                            Text('1078'),
                            Text('Posts'),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('368'),
                            Text('Followers'),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('21'),
                            Text('Folowing'),
                          ],
                        )
                      ],
                      views: [
                        builderPostsWidget(context),
                        builderFolowersWidget(context),
                        builderFolowingWidget(context),
                      ],
                      tabBarProperties: TabBarProperties(
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.withOpacity(0.2),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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
            Image.network(
              'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
              fit: BoxFit.cover,
            ),
            Image.network(
              'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
              fit: BoxFit.cover,
            ),
            Image.network(
              'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
              fit: BoxFit.cover,
            ),
            Image.network(
              'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
              fit: BoxFit.cover,
            ),
            Image.network(
              'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
              fit: BoxFit.cover,
            ),
            Image.network(
              'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
              fit: BoxFit.cover,
            ),
            Image.network(
              'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
              fit: BoxFit.cover,
            ),
            Image.network(
              'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
              fit: BoxFit.cover,
            ),
            Image.network(
              'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
              fit: BoxFit.cover,
            ),
            Image.network(
              'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
              fit: BoxFit.cover,
            ),
            Image.network(
              'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
              fit: BoxFit.cover,
            ),
            Image.network(
              'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
              fit: BoxFit.cover,
            ),
            Image.network(
              'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
              fit: BoxFit.cover,
            ),
            Image.network(
              'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
              fit: BoxFit.cover,
            ),
            Image.network(
                'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
                fit: BoxFit.cover),
            Image.network(
                'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
                fit: BoxFit.cover),
            Image.network(
                'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
                fit: BoxFit.cover),
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
