import 'package:astronaut_libraries/widget/custom_text.dart';
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
            itemCount: 2,
            itemBuilder: (context, index) {
              return SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(
                        text: 'Naser Alomosh', fontsize: 16, textfield: true),
                    SizedBox(height: 5.h),
                    Image.network(
                      'https://www.pngitem.com/pimgs/m/513-5131184_flutter-everything-is-a-widget-hd-png-download.png',
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
