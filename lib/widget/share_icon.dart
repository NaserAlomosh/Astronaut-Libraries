import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ShareIcon extends StatelessWidget {
  final void Function() onTap;

  const ShareIcon({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        FontAwesomeIcons.share,
        color: Colors.white.withOpacity(0.8),
        size: 26.sp,
      ),
    );
  }
}
