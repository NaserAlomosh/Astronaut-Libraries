import 'package:astronaut_libraries/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTwoButton extends StatelessWidget {
  final void Function() firstOnTap;
  final String firstTitle;
  final IconData firstIcon;
  final Color firstColor;
  //
  final void Function() lastOnTap;
  final Color lastColor;
  final String lastTitle;
  final IconData lastIcon;

  final bool startAlin;

  const CustomTwoButton({
    super.key,
    required this.firstOnTap,
    required this.firstTitle,
    required this.firstIcon,
    required this.firstColor,
    required this.lastOnTap,
    required this.lastColor,
    required this.lastTitle,
    required this.lastIcon,
    this.startAlin = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          startAlin ? MainAxisAlignment.start : MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: firstOnTap,
          borderRadius: BorderRadius.circular(20.w),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(20.w),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal:
                      MediaQuery.of(context).size.width > 800 ? 12.w : 20.w,
                  vertical:
                      MediaQuery.of(context).size.width > 800 ? 20.h : 15.h,
                ),
                child: Center(
                  child: Row(
                    children: [
                      Icon(
                        firstIcon,
                        color: Colors.blueAccent,
                        size: MediaQuery.of(context).size.width > 800
                            ? 8.sp
                            : 18.sp,
                      ),
                      SizedBox(width: 5.w),
                      CustomText(
                        textfield: true,
                        text: firstTitle,
                        fontsize:
                            MediaQuery.of(context).size.width > 800 ? 10 : 14,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 10.w),
        InkWell(
          onTap: lastOnTap,
          borderRadius: BorderRadius.circular(20.w),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(20.w),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal:
                    MediaQuery.of(context).size.width > 800 ? 12.w : 20.w,
                vertical: MediaQuery.of(context).size.width > 800 ? 20.h : 15.h,
              ),
              child: Center(
                child: Row(
                  children: [
                    Icon(
                      lastIcon,
                      color: Colors.white,
                      size: MediaQuery.of(context).size.width > 800
                          ? 8.sp
                          : 18.sp,
                    ),
                    SizedBox(width: 5.w),
                    CustomText(
                      textfield: true,
                      text: lastTitle,
                      fontsize:
                          MediaQuery.of(context).size.width > 800 ? 10 : 14,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
