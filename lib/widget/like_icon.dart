import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LikeIcon extends StatelessWidget {
  final void Function() onTap;
  final bool? userLike;
  const LikeIcon({super.key, required this.userLike, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Icon(
        userLike == null
            ? Icons.favorite_border
            : (userLike! ? Icons.favorite : Icons.favorite_border),
        color: userLike == null
            ? Colors.white.withOpacity(0.8)
            : (userLike == true ? Colors.red : Colors.white.withOpacity(0.8)),
        size: 26.sp,
      ),
    );
  }
}
