import 'package:astronaut_libraries/classes/navigation/app_navigation.dart';
import 'package:astronaut_libraries/view/home/home.dart';
import 'package:astronaut_libraries/view/sign_up/sign_up_view.dart';
import 'package:astronaut_libraries/view_model/sign_in/cubit.dart';
import 'package:astronaut_libraries/view_model/sign_in/states.dart';
import 'package:astronaut_libraries/widget/custom_text.dart';
import 'package:astronaut_libraries/widget/custom_text_buttom.dart';
import 'package:astronaut_libraries/widget/text_fiald_add_new.dart';
import 'package:astronaut_libraries/widget/two_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            body: Center(
              child: Lottie.asset(
                'assets/sign_in.json',
                height: double.infinity,
                width: double.infinity,
              ),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.black.withOpacity(0.6),
            body: BlocProvider(
              create: (context) => SignInCubit(),
              child: BlocConsumer<SignInCubit, SignInState>(
                listener: (context, state) {
                  if (state is SignInSucssesState) {
                    AppNavigation().pushReplacement(context, const HomeView());
                  }
                },
                builder: (context, state) {
                  if (state is SignInLoadingState) {
                    return Center(
                      child: Lottie.asset('assets/loading.json'),
                    );
                  } else {
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 50.h),
                              const CustomText(
                                text: 'Welcome Back',
                                fontsize: 50,
                              ),
                              const CustomText(
                                text: 'Sign In',
                                fontsize: 50,
                              ),
                              SizedBox(height: 80.h),
                              AddTextFiald(
                                  textInputType: TextInputType.emailAddress,
                                  controller: emailController,
                                  hintText: 'enter your email',
                                  onChanged: (_) {},
                                  sucsses: false),
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
                                label: 'Sign in',
                                onPressed: () async {
                                  await context.read<SignInCubit>().signInCubit(
                                        email: emailController.text,
                                        password: passwordController.text,
                                      );
                                },
                              ),
                              SizedBox(height: 20.h),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomText(
                                    textfield: true,
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
                                    textfield: true,
                                    text: 'sign in with',
                                    fontsize: 12,
                                  ),
                                ],
                              ),
                              SizedBox(height: 20.h),
                              CustomTwoButton(
                                facebookOnTap: () {},
                                googleOnTap: () {},
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
                                      text: 'You don\'t have account?',
                                      fontsize: 12,
                                    ),
                                    SizedBox(width: 5.w),
                                    InkWell(
                                      onTap: () {
                                        AppNavigation().pushFade(
                                            context, const SignUpView());
                                      },
                                      child: const CustomText(
                                        textfield: true,
                                        text: 'Sign Up',
                                        color: Colors.blueAccent,
                                        fontsize: 12,
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
