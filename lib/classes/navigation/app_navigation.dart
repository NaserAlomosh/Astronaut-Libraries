import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppNavigation {
  navigatoinPush(BuildContext context, Widget screen) {
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

  navigatoinPushReplacement(BuildContext context, Widget screen) {
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

  pushReplacmentRightToLeftWithFade(BuildContext context, Widget screen) {
    Get.offAll(() => screen, transition: Transition.rightToLeftWithFade);
  }

  navigatoinPushZoom(BuildContext context, Widget screen) {
    Get.to(() => screen, transition: Transition.zoom);
  }

  navigatoinPushFadeIn(BuildContext context, Widget screen) {
    Get.to(() => screen, transition: Transition.fadeIn);
  }

  navigatoinPushFade(BuildContext context, Widget screen) {
    Get.to(() => screen, transition: Transition.fade);
  }
}
