import 'package:astronaut_libraries/widget/custom_text.dart';
import 'package:flutter/material.dart';


class FavoriteLibrary extends StatelessWidget {
  const FavoriteLibrary({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CustomText(text: '1', fontsize: 40),
    );
  }
}
