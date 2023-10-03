import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddTextFiald extends StatelessWidget {
  final TextEditingController controller;

  final String hintText;

  final bool obscureText;
  final bool error;
  final void Function(String) onChanged;
  final bool cheak;
  const AddTextFiald({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    required this.onChanged,
    required this.error,
    this.cheak = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.w),
        child: Container(
          color: Colors.white10,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              onChanged: onChanged,
              obscureText: obscureText,
              controller: controller,
              style: TextStyle(color: Colors.white.withOpacity(0.8)),
              decoration: InputDecoration(
                suffixIcon: cheak == true
                    ? controller.text == ""
                        ? null
                        : error == true
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
                hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
