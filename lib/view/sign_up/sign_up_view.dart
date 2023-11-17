import 'package:astronaut_libraries/view/home/home.dart';
import 'package:astronaut_libraries/view_model/sign_up/cubit.dart';
import 'package:astronaut_libraries/view_model/sign_up/states.dart';
import 'package:astronaut_libraries/widget/custom_text.dart';
import 'package:astronaut_libraries/widget/custom_text_buttom.dart';
import 'package:astronaut_libraries/widget/first_last_textfild.dart';
import 'package:astronaut_libraries/widget/text_fiald_add_new.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

import '../../classes/navigation/app_navigation.dart';
import '../../widget/two_button.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            body: Center(
              child: Lottie.asset('assets/sign_in.json'),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.black.withOpacity(0.6),
            body: BlocProvider(
              create: (context) => SignUpCubit(),
              child: BlocConsumer<SignUpCubit, SignUpState>(
                listener: (context, state) {
                  if (state is SignUpSuccessState) {
                    AppNavigation().pushReplacmentRightToLeftWithFade(
                        context, const HomeView());
                  }
                },
                builder: (context, state) {
                  if (state is SignUpLoadingState) {
                    return Center(
                      child: Lottie.asset('assets/loading.json'),
                    );
                  } else {
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 50.h),
                              CustomText(
                                text: 'Welcome Back',
                                fontsize:
                                    MediaQuery.of(context).size.width > 800
                                        ? 34
                                        : 50,
                              ),
                              CustomText(
                                text: 'Sign Up',
                                fontsize:
                                    MediaQuery.of(context).size.width > 800
                                        ? 34
                                        : 50,
                              ),
                              SizedBox(height: 80.h),
                              FirstLastTextFiald(
                                firstController: firstNameController,
                                lastController: lastNameController,
                              ),
                              SizedBox(height: 20.h),
                              AddTextFiald(
                                textInputType: TextInputType.phone,
                                controller: phoneController,
                                hintText: 'enter your phone',
                                onChanged: (_) {},
                                sucsses: false,
                              ),
                              SizedBox(height: 20.h),
                              AddTextFiald(
                                textInputType: TextInputType.emailAddress,
                                controller: emailController,
                                hintText: 'enter your email',
                                onChanged: (_) {},
                                sucsses: false,
                              ),
                              SizedBox(height: 20.h),
                              AddTextFiald(
                                textInputType: TextInputType.visiblePassword,
                                controller: passwordController,
                                hintText: 'password',
                                onChanged: (_) {},
                                sucsses: false,
                              ),
                              SizedBox(height: 20.h),
                              CustomTextButton(
                                label: 'Sign up',
                                onPressed: () async {
                                  await context.read<SignUpCubit>().signUpCubit(
                                        email: emailController.text.trim(),
                                        firstName:
                                            firstNameController.text.trim(),
                                        lastName:
                                            lastNameController.text.trim(),
                                        password: passwordController.text,
                                        phone: phoneController.text.trim() != ''
                                            ? int.parse(
                                                phoneController.text.trim())
                                            : 0,
                                      );
                                },
                              ),
                              SizedBox(height: 20.h),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomText(
                                    text: '- or -',
                                    fontsize: 12,
                                  ),
                                ],
                              ),
                              SizedBox(height: 5.h),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomText(
                                      text: 'sign up with', fontsize: 12),
                                ],
                              ),
                              SizedBox(height: 20.h),
                              CustomTwoButton(
                                firstColor: Colors.blueAccent,
                                firstIcon: FontAwesomeIcons.facebook,
                                firstOnTap: () {},
                                firstTitle: 'Facebook',
                                lastColor: Colors.red,
                                lastIcon: FontAwesomeIcons.google,
                                lastOnTap: () {},
                                lastTitle: 'google',
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(25),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const CustomText(
                                      textfield: true,
                                      text: 'already you have account?',
                                      fontsize: 12,
                                    ),
                                    SizedBox(width: 5.w),
                                    InkWell(
                                      onTap: () {
                                        AppNavigation().back();
                                      },
                                      child: const CustomText(
                                        textfield: true,
                                        text: 'Sign in',
                                        color: Colors.blueAccent,
                                        fontsize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
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
