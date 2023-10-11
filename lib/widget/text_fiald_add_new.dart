import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddTextFiald extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final bool? sucsses;
  final void Function(String) onChanged;
  final bool cheak;

  final int maxLines;

  final TextInputType textInputType;
  const AddTextFiald({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    required this.onChanged,
    required this.sucsses,
    this.cheak = false,
    this.maxLines = 1,
    this.textInputType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.w),
        child: Container(
          height: 50.h,
          color: Colors.white10,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Center(
              child: TextField(
                onChanged: onChanged,
                obscureText: obscureText,
                controller: controller,
                maxLines: maxLines,
                keyboardType: textInputType,
                style: TextStyle(
                    color: Colors.white.withOpacity(0.8), fontSize: 14.sp),
                decoration: InputDecoration(
                  suffixIcon: cheak == true
                      ? controller.text == ""
                          ? null
                          : sucsses == false
                              ? const Icon(
                                  Icons.error_outline_outlined,
                                  color: Colors.red,
                                )
                              : const Icon(
                                  Icons.check,
                                  color: Colors.green,
                                )
                      : null,
                  hintText: hintText,
                  hintStyle: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.white.withOpacity(0.6),
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
