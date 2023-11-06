import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShareIcon extends StatelessWidget {
  final void Function() onTap;

  const ShareIcon({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        Icons.share_sharp,
        color: Colors.white.withOpacity(0.8),
        size: 26.sp,
      ),
    );
  }
}
