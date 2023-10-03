import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustemHomeWidget extends StatelessWidget {
  final IconData? icon;

  final String lable;

  final void Function() onTap;

  const CustemHomeWidget(
      {super.key, this.icon, required this.lable, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(20.w),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.w),
              color: Colors.black.withOpacity(0.4)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.grey,
                size: 100.w,
              ),
              Text(
                lable,
                style: TextStyle(fontSize: 20.sp),
              )
            ],
          ),
        ),
      ),
    );
  }
}
