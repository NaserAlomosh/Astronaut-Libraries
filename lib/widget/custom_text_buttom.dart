import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/link.dart';

class CustomTextButton extends StatelessWidget {
  final void Function()? onPressed;
  final String label;
  final bool link;
  final Uri? uri;
  const CustomTextButton({
    super.key,
    this.onPressed,
    required this.label,
    this.link = false,
    this.uri,
  });

  @override
  Widget build(BuildContext context) {
    return link == false
        ? Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(10.w)),
              child: TextButton(
                onPressed: onPressed,
                child: Text(
                  label,
                  style: TextStyle(color: Colors.white.withOpacity(0.8)),
                ),
              ),
            ),
          )
        : Link(
            uri: uri,
            builder: (context, followLink) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(10.w)),
                child: TextButton(
                  onPressed: followLink,
                  child: Text(
                    label,
                    style: TextStyle(color: Colors.white.withOpacity(0.8)),
                  ),
                ),
              ),
            ),
          );
  }
}
