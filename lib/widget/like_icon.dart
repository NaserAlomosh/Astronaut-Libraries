import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:like_button/like_button.dart';

class LikeIcon extends StatelessWidget {
  final void Function() removeLike;
  final void Function() addLike;
  final bool? userLike;
  final int? likes;
  const LikeIcon({
    super.key,
    required this.userLike,
    required this.removeLike,
    this.likes,
    required this.addLike,
  });

  @override
  Widget build(BuildContext context) {
    return LikeButton(
      size: 20.sp,
      circleColor: const CircleColor(
        start: Colors.redAccent,
        end: Colors.redAccent,
      ),
      onTap: (isLiked) async {
        if (isLiked == true) {
          removeLike();
        } else {
          addLike();
        }
        isLiked = !isLiked;
        return isLiked;
      },
      bubblesColor: const BubblesColor(
        dotPrimaryColor: Colors.redAccent,
        dotSecondaryColor: Colors.redAccent,
      ),
      likeBuilder: (bool isLiked) {
        return Icon(
          Icons.favorite,
          color: isLiked ? Colors.red : Colors.grey,
          size: 30.sp,
        );
      },
      likeCount: likes,
      isLiked: userLike,
      countBuilder: (int? count, bool isLiked, String text) {
        var color = isLiked ? Colors.red : Colors.grey;
        Widget result;

        result = Padding(
          padding: EdgeInsets.only(left: 8, top: 8.h),
          child: Text(
            text,
            style: TextStyle(color: color, fontSize: 20.sp),
          ),
        );
        return result;
      },
    );
  }
}
