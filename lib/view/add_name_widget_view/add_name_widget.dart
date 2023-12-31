import 'package:astronaut_libraries/widget/custom_text_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../classes/navigation/app_navigation.dart';
import '../../view_model/add_name_widget/cubit.dart';
import '../../view_model/add_name_widget/states.dart';
import '../../widget/text_fiald_add_new.dart';
import '../home/home.dart';

class AddNameWidgetView extends StatefulWidget {
  const AddNameWidgetView({super.key});

  @override
  State<AddNameWidgetView> createState() => _AddNameWidgetViewState();
}

class _AddNameWidgetViewState extends State<AddNameWidgetView> {
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
                    AppNavigation().pushReplacement(context, const HomeView());
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
                            sucsses: false,
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
                            sucsses: context
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
                            sucsses: false,
                            onChanged: (p0) {},
                            controller: adminPasswordLibraryController,
                            hintText: 'enter admin password',
                            obscureText: true,
                          ),
                          SizedBox(height: 20.h),
                          CustomTextButton(
                            label: 'Create',
                            onPressed: () async {
                              await context.read<AddNameLibraryCubit>().addName(
                                    type: nameLibraryController.text,
                                    confirmtype:
                                        confirmNameLibraryController.text,
                                    adminPassword:
                                        adminPasswordLibraryController.text,
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
          ),
        ],
      ),
    );
  }
}
