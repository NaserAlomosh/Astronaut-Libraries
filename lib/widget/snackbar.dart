import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:astronaut_libraries/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSnackBar {
  static void animatedSnackBar(
      {required BuildContext context, required String text}) {
    AnimatedSnackBar(
      mobileSnackBarPosition: MobileSnackBarPosition.bottom,
      duration: const Duration(milliseconds: 1500),
      builder: ((context) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.sp),
          child: Container(
            height: 30.h,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(30.sp)),
            child: const Center(
              child: CustomText(
                textfield: true,
                fontsize: 14,
                text: 'No more',
              ),
            ),
          ),
        );
      }),
    ).show(context);
  }
}
