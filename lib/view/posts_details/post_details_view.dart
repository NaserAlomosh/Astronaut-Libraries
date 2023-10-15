import 'package:astronaut_libraries/widget/custom_icon.dart';
import 'package:astronaut_libraries/widget/custom_text.dart';
import 'package:astronaut_libraries/widget/two_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:readmore/readmore.dart';

class PostDetailsView extends StatelessWidget {
  final String image;

  final String description;

  final String profileImage;

  const PostDetailsView({
    super.key,
    required this.image,
    required this.description,
    required this.profileImage,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(4),
            child: InkWell(
              borderRadius: BorderRadius.circular(30.w),
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Stack(
                children: [
                  SizedBox(
                    height: 40,
                    width: 40,
                    child: Lottie.asset(
                      'assets/back_icon.json',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    color: Colors.black.withOpacity(0.4),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 18.sp,
                          backgroundImage: NetworkImage(
                            profileImage,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        const CustomText(
                          text: 'Naser Alomosh',
                          fontsize: 16,
                          textfield: true,
                        ),
                      ],
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(20.sp),
                      onTap: () {},
                      child: const CustomIcons(
                        icon: Icons.more_horiz,
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: SizedBox(
                  width: double.infinity,
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                    child: const CustomIcons(
                      color: Colors.red,
                      icon: FontAwesomeIcons.solidHeart,
                      size: 25,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                    child: const CustomIcons(
                      icon: FontAwesomeIcons.comment,
                      size: 25,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                    child: const CustomIcons(
                      icon: FontAwesomeIcons.share,
                      size: 25,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 5.w,
                ),
                child: const CustomText(
                  text: '54 Likes',
                  fontsize: 18,
                  textfield: true,
                ),
              ),
              SizedBox(height: 5.h),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 5.w,
                ),
                child: const CustomText(
                  text: 'Naser Alomosh',
                  fontsize: 18,
                  textfield: true,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: ReadMoreText(
                  description,
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.8), fontSize: 14.sp),
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: ' Show more',
                  trimExpandedText: ' Show less',
                  moreStyle: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.blueAccent,
                  ),
                  lessStyle: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                child: const CustomText(
                  text: 'View all 100 coments',
                  fontsize: 18,
                  textfield: true,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 10),
              CustomTwoButton(
                firstColor: Colors.blue,
                firstIcon: FontAwesomeIcons.deviantart,
                firstOnTap: () {},
                firstTitle: 'pub.dev',
                lastColor: Colors.white,
                lastIcon: FontAwesomeIcons.github,
                lastOnTap: () {},
                startAlin: true,
                lastTitle: 'github',
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
