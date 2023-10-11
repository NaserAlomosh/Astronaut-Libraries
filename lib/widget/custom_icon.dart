import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIcons extends StatelessWidget {
  final IconData icon;

  final double size;

  const CustomIcons({super.key, required this.icon, required this.size});

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: size.sp,
      color: Colors.white.withOpacity(0.8),
    );
  }
}
