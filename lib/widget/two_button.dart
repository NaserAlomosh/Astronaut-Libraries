import 'package:astronaut_libraries/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomTwoButton extends StatelessWidget {
  final void Function() facebookOnTap;

  final void Function() googleOnTap;

  const CustomTwoButton(
      {super.key, required this.facebookOnTap, required this.googleOnTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: facebookOnTap,
            borderRadius: BorderRadius.circular(20.w),
            child: Container(
              height: 45.h,
              width: 150.w,
              decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(20.w)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Center(
                  child: Row(
                    children: [
                      Icon(
                        MdiIcons.facebook,
                        color: Colors.blueAccent,
                      ),
                      CustomText(text: 'facebook', fontsize: 14.sp)
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 10.w),
          InkWell(
            onTap: googleOnTap,
            borderRadius: BorderRadius.circular(20.w),
            child: Container(
              height: 45.h,
              width: 150.w,
              decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(20.w)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Center(
                  child: Row(
                    children: [
                      Icon(
                        MdiIcons.google,
                        color: Colors.red,
                      ),
                      CustomText(text: 'gmail', fontsize: 14.sp)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
