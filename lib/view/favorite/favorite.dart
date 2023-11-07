import 'package:astronaut_libraries/widget/custom_text.dart';
import 'package:astronaut_libraries/widget/like_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Expanded(
            child: Center(
              child: Container(
                child: Lottie.asset('assets/favorite.json'),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.transparent.withOpacity(0.6),
            ),
          ),
          ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(radius: 18.sp),
                          SizedBox(width: 5.w),
                          const CustomText(
                            text: 'Naser Alomosh',
                            fontsize: 16,
                            textfield: true,
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.sp),
                        child: Image.network(
                          'https://www.pngitem.com/pimgs/m/513-5131184_flutter-everything-is-a-widget-hd-png-download.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          LikeIcon(
                            userLike: true,
                            removeLike: () {},
                            addLike: () {},
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      const CustomText(
                        text: 'Naser Alomosh',
                        fontsize: 16,
                        textfield: true,
                      ),
                      const CustomText(
                        viewMore: false,
                        text:
                            'Naser Alomosh ajbj a hsjh sha iuhas h; iuu g guy fsa m aj klshsl hausghsug lsuygsauyg sauyf uysafstay  fstf tyft stau tsa gaui gs uyag iugsa iug liysaf yfa ay fsayu fyg f ay fuysgauyfy',
                        fontsize: 14,
                        textfield: true,
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
