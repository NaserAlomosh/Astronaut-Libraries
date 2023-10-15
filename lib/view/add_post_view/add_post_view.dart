import 'package:astronaut_libraries/classes/navigation/app_navigation.dart';
import 'package:astronaut_libraries/view/home/home.dart';
import 'package:astronaut_libraries/view_model/add_post/cubit.dart';
import 'package:astronaut_libraries/view_model/add_post/states.dart';
import 'package:astronaut_libraries/widget/custom_text.dart';
import 'package:astronaut_libraries/widget/custom_text_buttom.dart';
import 'package:astronaut_libraries/widget/text_fiald_add_new.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class AddPostView extends StatelessWidget {
  const AddPostView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController descriptionController = TextEditingController();

    TextEditingController gitHubController = TextEditingController();

    TextEditingController pubDevcontroller = TextEditingController();

    return BlocProvider(
      create: (context) => AddPostCubit(),
      child: SafeArea(
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
              body: BlocConsumer<AddPostCubit, AddPostState>(
                listener: (context, state) {
                  if (state is AddPostSucssesState) {
                    AppNavigation().pushFade(
                        context,
                        const HomeView(
                          indexPage: 3,
                        ));
                  }
                },
                builder: (context, state) {
                  if (state is AddPostLoadingState) {
                    return Center(
                      child: Lottie.asset('assets/loading.json'),
                    );
                  } else {
                    var addCubit = context.read<AddPostCubit>();
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomText(
                            text: 'What are you thinking about asghdjsa ?',
                            fontsize: 40,
                          ),
                          SizedBox(height: 20.h),
                          AddTextFiald(
                            maxLines: 7,
                            controller: descriptionController,
                            hintText: 'description',
                            onChanged: (_) {},
                            sucsses: false,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          AddTextFiald(
                            controller: pubDevcontroller,
                            hintText: 'pub.dev',
                            onChanged: (_) {},
                            sucsses: false,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          AddTextFiald(
                            controller: gitHubController,
                            hintText: 'GitHub',
                            onChanged: (_) {},
                            sucsses: false,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Container(
                              height: 200.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white10,
                                borderRadius: BorderRadius.circular(10.w),
                              ),
                              child: InkWell(
                                onTap: () {
                                  addCubit.selectImagePost();
                                },
                                child: Center(
                                  child: addCubit.image == null
                                      ? Text(
                                          'Click for select photo',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 20.sp,
                                          ),
                                        )
                                      : Image.file(
                                          addCubit.image!,
                                          fit: BoxFit.fill,
                                        ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.h),
                          CustomTextButton(
                            label: 'Share post',
                            onPressed: () {
                              addCubit.addPostCubit(
                                description: descriptionController.text,
                                gitHubUrl: gitHubController.text,
                                pubDevUrl: pubDevcontroller.text,
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
