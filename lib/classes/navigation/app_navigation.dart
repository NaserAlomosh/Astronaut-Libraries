import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppNavigation {
  push(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => screen,
        transitionDuration: const Duration(milliseconds: 400),
        transitionsBuilder: (_, a, __, c) =>
            FadeTransition(opacity: a, child: c),
      ),
    );
  }

  pushReplacement(BuildContext context, Widget screen) {
    Navigator.pushAndRemoveUntil(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => screen,
        transitionDuration: const Duration(milliseconds: 400),
        transitionsBuilder: (_, a, __, c) =>
            FadeTransition(opacity: a, child: c),
      ),
      (Route<dynamic> route) => false,
    );
  }

  back() {
    Get.back();
  }

  pushReplacmentRightToLeftWithFade(BuildContext context, Widget screen) {
    Get.offAll(screen, transition: Transition.rightToLeftWithFade);
  }

  pushZoom(BuildContext context, Widget screen) {
    Get.to(screen, transition: Transition.zoom);
  }

  pushFadeIn(BuildContext context, Widget screen) {
    Get.to(screen, transition: Transition.fadeIn);
  }

  pushFade(BuildContext context, Widget screen) {
    Get.to(screen, transition: Transition.fade);
  }
}
