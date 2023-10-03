import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../classes/navigation/app_navigation.dart';
import '../../view_model/add_name_library/cubit.dart';
import '../../view_model/add_name_library/states.dart';
import '../../widget/text_fiald_add_new.dart';
import '../home/home.dart';

class AddNameLibraryView extends StatefulWidget {
  const AddNameLibraryView({super.key});

  @override
  State<AddNameLibraryView> createState() => _AddNameLibraryViewState();
}

class _AddNameLibraryViewState extends State<AddNameLibraryView> {
  TextEditingController nameLibraryController = TextEditingController();
  TextEditingController confirmNameLibraryController = TextEditingController();
  TextEditingController adminPasswordLibraryController =
      TextEditingController();
  @override
  void dispose() {
    nameLibraryController.dispose();
    confirmNameLibraryController.dispose();
    adminPasswordLibraryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child:
                  Lottie.asset('assets/add_new.json', height: double.infinity),
            ),
          ),
          BlocProvider(
            create: (context) => AddNameLibraryCubit(),
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
                          Lottie.asset(
                            'assets/back_icon.json',
                            fit: BoxFit.cover,
                          ),
                          Container(
                            color: Colors.black.withOpacity(0.4),
                          ),
                        ],
                      )),
                ),
              ),
              backgroundColor: Colors.black.withOpacity(0.85),
              body: BlocConsumer<AddNameLibraryCubit, AddNameLibraryState>(
                listener: (context, state) {
                  if (state is AddNameSucssesState) {
                    AppNavigation()
                        .animatedNavigatoin(context, const HomeView());
                  }
                },
                builder: (context, state) {
                  if (state is AddNameLoadingState) {
                    return Center(
                      child: Lottie.asset('assets/loading.json'),
                    );
                  } else {
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 130.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Text(
                              'Add New Name Widget',
                              style: TextStyle(
                                  fontSize: 40.sp, color: Colors.grey),
                            ),
                          ),
                          SizedBox(height: 70.h),
                          AddTextFiald(
                            error: false,
                            controller: nameLibraryController,
                            hintText: 'enter type name',
                            onChanged: (p0) {
                              context
                                  .read<AddNameLibraryCubit>()
                                  .cheakTextFiald(
                                      confirmNameLibraryController.text, p0);
                            },
                          ),
                          SizedBox(height: 10.h),
                          AddTextFiald(
                            error: context
                                .read<AddNameLibraryCubit>()
                                .confirmNameWidgetCheak,
                            cheak: true,
                            onChanged: (p0) {
                              context
                                  .read<AddNameLibraryCubit>()
                                  .cheakTextFiald(
                                    nameLibraryController.text,
                                    p0,
                                  );
                            },
                            controller: confirmNameLibraryController,
                            hintText: 'confirm type name',
                          ),
                          SizedBox(height: 10.h),
                          AddTextFiald(
                            error: false,
                            onChanged: (p0) {},
                            controller: adminPasswordLibraryController,
                            hintText: 'enter admin password',
                            obscureText: true,
                          ),
                          SizedBox(height: 20.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.white10,
                                  borderRadius: BorderRadius.circular(10.w)),
                              child: TextButton(
                                onPressed: () async {
                                  await context
                                      .read<AddNameLibraryCubit>()
                                      .addName(
                                          type: nameLibraryController.text,
                                          confirmtype:
                                              confirmNameLibraryController.text,
                                          adminPassword:
                                              adminPasswordLibraryController
                                                  .text);
                                },
                                child: Text(
                                  'Create',
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.8)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
