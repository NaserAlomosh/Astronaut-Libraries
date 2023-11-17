import 'package:astronaut_libraries/view/sign_in/sign_in_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'style/color_app.dart';

class Player {
  String name;
  int score;

  Player(this.name, this.score);
}

SharedPreferences? prefs;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      //name: 'astronaut libraries',
      // options: const FirebaseOptions(
      //   apiKey: "AIzaSyCwMMhHPhTF_RdP8wu2la9oWMn_e1mPDik",
      //   appId: "1:16818078429:android:d602607f52a73813305134",
      //   messagingSenderId: "16818078429",
      //   projectId: "Astronaut-libraries",
      // ),
      );
  await ScreenUtil.ensureScreenSize();
  prefs = await SharedPreferences.getInstance();
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
          GetMaterialApp(
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
        home: const SignInView(),
      ),
    );
  }
}

int calculateAge(DateTime birthDate) {
  final now = DateTime.now();
  int age = now.year - birthDate.year;

  if (now.month < birthDate.month ||
      (now.month == birthDate.month && now.day < birthDate.day)) {
    age--; // Subtract one year if the birthdate has not occurred yet this year.
  }

  return age;
}
