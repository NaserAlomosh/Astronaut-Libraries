import 'package:astronaut_libraries/classes/navigation/app_navigation.dart';
import 'package:astronaut_libraries/view/home/home.dart';
import 'package:astronaut_libraries/view_model/add_library_lib/cubit.dart';
import 'package:astronaut_libraries/view_model/add_library_lib/states.dart';
import 'package:astronaut_libraries/widget/custom_text_buttom.dart';
import 'package:astronaut_libraries/widget/text_fiald_add_new.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class AddLibraryView extends StatefulWidget {
  final String widgetName;
  const AddLibraryView({super.key, required this.widgetName});

  @override
  State<AddLibraryView> createState() => _AddLibraryViewState();
}

class _AddLibraryViewState extends State<AddLibraryView> {
  TextEditingController? lipraryNameController;
  TextEditingController? confirmlipraryNameController;
  TextEditingController? githubUrlController;
  TextEditingController? pubDevUrlController;
  TextEditingController? adminPasswordcontroller;
  @override
  void initState() {
    lipraryNameController = TextEditingController();
    confirmlipraryNameController = TextEditingController();
    githubUrlController = TextEditingController();
    pubDevUrlController = TextEditingController();
    adminPasswordcontroller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    lipraryNameController?.dispose();
    confirmlipraryNameController?.dispose();
    githubUrlController?.dispose();
    pubDevUrlController?.dispose();
    adminPasswordcontroller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddLibraryCubit(),
      child: SafeArea(
        child: Stack(
          children: [
            Scaffold(
              body: Center(
                child: Lottie.asset('assets/add_library.json'),
              ),
            ),
            Scaffold(
              backgroundColor: Colors.black.withOpacity(0.6),
            ),
            BlocConsumer<AddLibraryCubit, AddLibraryState>(
              listener: (context, state) {
                if (state is AddLibrarySucssesState) {
                  AppNavigation()
                      .navigatoinPushReplacement(context, const HomeView());
                }
              },
              builder: (context, state) {
                if (state is AddLibraryLoadingState) {
                  return Center(
                    child: Lottie.asset('assets/loading.json'),
                  );
                } else {
                  return Scaffold(
                    backgroundColor: Colors.transparent,
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
                              Lottie.asset(
                                'assets/back_icon.json',
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
                          SizedBox(
                            height: 30.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Add New',
                                  style: TextStyle(
                                      fontSize: 40.sp, color: Colors.grey),
                                ),
                                Text(
                                  'Library',
                                  style: TextStyle(
                                      fontSize: 40.sp, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20.h),
                          AddTextFiald(
                            controller: lipraryNameController!,
                            hintText: 'library name',
                            onChanged: (_) {},
                            error: false,
                            cheak: false,
                          ),
                          SizedBox(height: 10.h),
                          AddTextFiald(
                            controller: confirmlipraryNameController!,
                            hintText: 'confirm liprary name',
                            onChanged: (_) {},
                            error: true,
                            cheak: true,
                          ),
                          SizedBox(height: 10.h),
                          AddTextFiald(
                            controller: githubUrlController!,
                            hintText: 'github url',
                            onChanged: (_) {},
                            error: false,
                            cheak: false,
                          ),
                          SizedBox(height: 10.h),
                          AddTextFiald(
                            controller: pubDevUrlController!,
                            hintText: 'pub.dev url',
                            onChanged: (_) {},
                            error: false,
                            cheak: false,
                          ),
                          SizedBox(height: 10.h),
                          AddTextFiald(
                            controller: adminPasswordcontroller!,
                            hintText: 'admin password',
                            onChanged: (_) {},
                            obscureText: true,
                            error: false,
                            cheak: false,
                          ),
                          SizedBox(height: 10.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Container(
                                height: 200.h,
                                decoration: BoxDecoration(
                                  color: Colors.white10,
                                  borderRadius: BorderRadius.circular(10.w),
                                ),
                                child: context.read<AddLibraryCubit>().image ==
                                        null
                                    ? InkWell(
                                        onTap: () {
                                          context
                                              .read<AddLibraryCubit>()
                                              .seletImage();
                                        },
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.add,
                                                color: Colors.grey,
                                                size: 100.sp,
                                              ),
                                              Text(
                                                'Cliek for select photo',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 20.sp),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    : Image.file(context
                                        .read<AddLibraryCubit>()
                                        .image!)),
                          ),
                          SizedBox(height: 20.h),
                          CustomTextButton(
                            onPressed: () {
                              context.read<AddLibraryCubit>().addLibrary(
                                  name: 'lipraryNameController.text',
                                  gitHubUrl: 'gitHubUrl',
                                  pubDevUrl: 'pubDevUrl',
                                  type: widget.widgetName);
                            },
                            label: 'Create',
                          ),
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
