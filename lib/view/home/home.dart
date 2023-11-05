import 'package:astronaut_libraries/view/direct/direct.dart';
import 'package:astronaut_libraries/view/profile/profile.dart';
import 'package:astronaut_libraries/view/search_user/search_user.dart';
import 'package:astronaut_libraries/view_model/home/cubit.dart';
import 'package:astronaut_libraries/view_model/home/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:lottie/lottie.dart';

import '../../classes/navigation/app_navigation.dart';
import '../../constant/icon/app_icon.dart';
import '../../constant/string/app_string_en.dart';
import '../../view_model/get_name_widget/cubit.dart';
import '../../view_model/get_name_widget/states.dart';
import '../../widget/custom_icon.dart';
import '../../widget/home_widget.dart';
import '../add_name_widget_view/add_name_widget.dart';
import '../add_post_view/add_post_view.dart';
import '../home_posts_view/home_posts_view.dart';
import '../librarys/librarys_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, this.indexPage = 0});
  final int indexPage;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetNameWidgetCubit()..getName(),
        ),
        BlocProvider(
          create: (context) => HomeCubit(selectedIndex: widget.indexPage),
        ),
      ],
      child: SafeArea(
        child: Stack(
          children: [
            Scaffold(
              backgroundColor: Colors.black,
              body: Center(
                child: Lottie.asset('assets/profile.json',
                    height: double.infinity, width: double.infinity),
              ),
            ),
            BlocConsumer<HomeCubit, HomeState>(
              listener: (context, state) {},
              builder: (context, state) {
                return Scaffold(
                  floatingActionButton:
                      context.read<HomeCubit>().selectedIndex == 3
                          ? FloatingActionButton(
                              backgroundColor: Colors.white.withOpacity(0.3),
                              child: const Icon(Icons.add),
                              onPressed: () {
                                AppNavigation()
                                    .pushDownToUp(context, const AddPostView());
                              },
                            )
                          : null,
                  backgroundColor: Colors.black.withOpacity(0.8),
                  drawer: BlocConsumer<GetNameWidgetCubit, GetNameWidgetState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is GetNameWidgetLoadingState) {
                        return Center(
                          child: Lottie.asset('assets/loading.json'),
                        );
                      } else {
                        return Drawer(
                          width: 180.w,
                          backgroundColor: Colors.black.withOpacity(0.4),
                          shadowColor: Colors.black.withOpacity(0.4),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Lottie.asset(
                                  'assets/header_logo.json',
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                                ListTile(
                                  trailing: InkWell(
                                    onTap: () {
                                      AppNavigation().push(
                                        context,
                                        const AddNameWidgetView(),
                                      );
                                    },
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 500,
                                  child: ListView.builder(
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        onTap: () {
                                          AppNavigation().push(
                                            context,
                                            LibrarysView(
                                              widgetName: context
                                                  .read<GetNameWidgetCubit>()
                                                  .nameWidgets[index]
                                                  .type
                                                  .toString(),
                                              added: false,
                                            ),
                                          );
                                        },
                                        trailing: const CustomIcons(
                                          icon: Icons
                                              .keyboard_arrow_right_rounded,
                                          size: 20,
                                        ),
                                        title: Text(
                                          context
                                              .read<GetNameWidgetCubit>()
                                              .nameWidgets[index]
                                              .type
                                              .toString(),
                                          style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.8),
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      );
                                    },
                                    itemCount: context
                                        .read<GetNameWidgetCubit>()
                                        .nameWidgets
                                        .length,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  appBar: AppBar(
                    leading: Builder(
                      builder: (context) => IconButton(
                        icon: Icon(
                          Icons.menu,
                          color: Colors.white.withOpacity(0.8),
                          size: 20.sp,
                        ),
                        onPressed: () => Scaffold.of(context).openDrawer(),
                      ),
                    ),
                    actions: [
                      InkWell(
                          onTap: () {
                            AppNavigation().pushRightToLeftWithFade(
                                context, const Direct());
                          },
                          child: CustomIcons(icon: Icons.chat, size: 20.sp)),
                    ],
                  ),
                  body: [
                    const HomePostsView(),
                    Container(),
                    const SearchUser(searchPage: true),
                    const ProfileView(),
                  ][context.read<HomeCubit>().selectedIndex],
                  bottomNavigationBar: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.1),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 20,
                          color: Colors.black.withOpacity(0.1),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GNav(
                        rippleColor: Colors.white,
                        hoverColor: Colors.black.withOpacity(0.4),
                        gap: 10.w,
                        activeColor: Colors.white,
                        iconSize: 25.sp,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12),
                        duration: const Duration(milliseconds: 400),
                        tabBackgroundColor: Colors.grey.withOpacity(0.4),
                        color: Colors.grey,
                        textSize: 1000,
                        style: GnavStyle.google,
                        textStyle: TextStyle(fontSize: 14.sp),
                        tabs: const [
                          GButton(
                            icon: AppIcons.home,
                            text: AppStringEN.home,
                            textSize: 1000,
                          ),
                          GButton(
                            icon: AppIcons.favorite,
                            text: AppStringEN.favorite,
                            textSize: 1000,
                          ),
                          GButton(
                            icon: AppIcons.search,
                            text: AppStringEN.search,
                            textSize: 1000,
                          ),
                          GButton(
                            icon: AppIcons.profile,
                            text: AppStringEN.profile,
                            textSize: 1000,
                          ),
                        ],
                        selectedIndex: context.read<HomeCubit>().selectedIndex,
                        onTabChange: (index) {
                          context.read<HomeCubit>().changeScreen(index);
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget builderHomeWidget(BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      children: [
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
          crossAxisCount: 2,
          children: [
            CustemHomeWidget(
              lable: 'Profile',
              icon: Icons.person,
              onTap: () {
                AppNavigation().push(context, const ProfileView());
              },
            ),
            CustemHomeWidget(
              lable: 'Favorite',
              icon: Icons.favorite,
              onTap: () {},
            ),
            CustemHomeWidget(
              lable: 'Setting',
              icon: Icons.settings,
              onTap: () {},
            ),
            CustemHomeWidget(
              lable: 'About us',
              icon: Icons.info,
              onTap: () {},
            ),
            CustemHomeWidget(
              lable: 'Support',
              icon: Icons.support_agent,
              onTap: () {},
            ),
            CustemHomeWidget(
              lable: 'Log out',
              icon: Icons.logout,
              onTap: () {},
            ),
          ],
        ),
      ],
    ),
  );
}
