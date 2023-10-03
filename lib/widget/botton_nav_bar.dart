import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../constant/icon/app_icon.dart';
import '../constant/string/app_string_en.dart';
import '../style/color_app.dart';
import '../view/account/account.dart';
import '../view/home/home.dart';
import '../view/search.dart';
import '../view/shopping_cart.dart';

class CustomGoogleNavBar extends StatefulWidget {
  const CustomGoogleNavBar({super.key});

  @override
  State<CustomGoogleNavBar> createState() => _CustomGoogleNavBarState();
}

class _CustomGoogleNavBarState extends State<CustomGoogleNavBar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: const [
          HomeView(),
          SearchView(),
          AccountView(),
          ShoppingCart(),
        ][selectedIndex],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.white.withOpacity(0.1),
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GNav(
              rippleColor: Colors.white,
              hoverColor: AppColor.primary.withOpacity(0.4),
              gap: 10.w,
              activeColor: Colors.white,
              iconSize: 25.sp,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: AppColor.primary,
              color: Colors.grey,
              tabs: const [
                GButton(
                  icon: AppIcons.home,
                  text: AppStringEN.home,
                ),
                GButton(
                  icon: AppIcons.favorite,
                  text: AppStringEN.favorite,
                ),
                GButton(
                  icon: AppIcons.search,
                  text: AppStringEN.search,
                ),
                GButton(
                  icon: AppIcons.profile,
                  text: AppStringEN.profile,
                ),
              ],
              selectedIndex: selectedIndex,
              onTabChange: (index) {
                setState(
                  () {
                    selectedIndex = index;
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
