import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FirstLastTextFiald extends StatelessWidget {
  final TextEditingController firstController;
  final TextEditingController lastController;

  const FirstLastTextFiald(
      {super.key, required this.firstController, required this.lastController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width > 800 ? 100.w : 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(10.sp)),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical:
                        MediaQuery.of(context).size.width > 800 ? 8.h : 0),
                child: TextField(
                  controller: firstController,
                  style: TextStyle(color: Colors.white.withOpacity(0.8)),
                  decoration: InputDecoration(
                    hintText: 'first name',
                    hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: MediaQuery.of(context).size.width > 800
                          ? 10.sp
                          : 12.sp,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(10.sp)),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical:
                        MediaQuery.of(context).size.width > 800 ? 8.h : 0),
                child: TextField(
                  controller: lastController,
                  style: TextStyle(color: Colors.white.withOpacity(0.8)),
                  decoration: InputDecoration(
                    hintText: 'first name',
                    hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: MediaQuery.of(context).size.width > 800
                          ? 10.sp
                          : 12.sp,
                    ),
                    border: InputBorder.none,
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
