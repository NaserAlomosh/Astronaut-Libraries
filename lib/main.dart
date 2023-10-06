import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'style/color_app.dart';
import 'view/home/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await ScreenUtil.ensureScreenSize();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      //
      designSize: const Size(411.42857142857144, 867.4285714285714),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) =>
          //
          MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                fontFamily: 'Gabarito',
                scaffoldBackgroundColor: AppColor.scaffoldBackgroundColor,
                appBarTheme: const AppBarTheme(
                  color: Colors.transparent,
                  elevation: 0,
                ),
                textTheme: const TextTheme(
                  displayLarge: TextStyle(color: Colors.white),
                  displayMedium: TextStyle(color: Colors.white),
                  bodyMedium: TextStyle(color: Colors.white),
                  titleMedium: TextStyle(color: Colors.white),
                ),
              ),
              home: const HomeView()),
    );
  }
}
