import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends StatelessWidget {
  final String text;

  final double fontsize;

  final Color? color;

  final bool textfield;

  final bool viewMore;
  const CustomText({
    super.key,
    required this.text,
    required this.fontsize,
    this.color = Colors.white,
    this.textfield = false,
    this.viewMore = false,
  });

  @override
  Widget build(BuildContext context) {
    return textfield == true
        ? Text(
            text,
            maxLines: viewMore ? 1000 : 1,
            style: TextStyle(
              color: color?.withOpacity(0.8),
              fontSize: fontsize.sp,
              overflow: viewMore ? TextOverflow.ellipsis : null,
            ),
          )
        : Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Text(
              text,
              style: TextStyle(
                color: color?.withOpacity(0.8),
                fontSize: fontsize.sp,
                overflow: viewMore ? TextOverflow.ellipsis : null,
              ),
            ),
          );
  }
}
