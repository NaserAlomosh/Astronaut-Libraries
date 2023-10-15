import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIcons extends StatelessWidget {
  final IconData icon;

  final double size;

  final Color? color;

  const CustomIcons({
    super.key,
    required this.icon,
    required this.size,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: size.sp,
      color: color!.withOpacity(0.8),
    );
  }
}
