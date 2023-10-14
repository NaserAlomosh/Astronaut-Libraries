import 'package:astronaut_libraries/widget/text_fiald_add_new.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class AddPostView extends StatelessWidget {
  const AddPostView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            body: Center(
              child: Lottie.asset(
                'assets/add_post.json',
                height: double.infinity,
                width: double.infinity,
              ),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.black.withOpacity(0.5),
            body: Column(
              children: [
                AddTextFiald(
                  maxLines: 7,
                  controller: controller,
                  hintText: 'description',
                  onChanged: (_) {},
                  sucsses: false,
                ),
                SizedBox(height: 10.h),
                AddTextFiald(
                  controller: controller,
                  hintText: 'pub.dev',
                  onChanged: (_) {},
                  sucsses: false,
                ),
                SizedBox(height: 10.h),
                AddTextFiald(
                  controller: controller,
                  hintText: 'GitHub',
                  onChanged: (_) {},
                  sucsses: false,
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Container(
                      height: 200.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(10.w),
                      ),
                      child:
                          // context.read<AddLibraryCubit>().image == null
                          //?
                          InkWell(
                        onTap: () {
                          //context.read<AddLibraryCubit>().seletImage();
                        },
                        child: Center(
                          child: Text(
                            'Click for select photo',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20.sp,
                            ),
                          ),
                        ),
                      )
                      // : Center(
                      //     child: SizedBox(
                      //       width: double.infinity,
                      //       child: Image.file(
                      //         context.read<AddLibraryCubit>().image!,
                      //         fit: BoxFit.fill,
                      //       ),
                      //     ),
                      //   ),
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
