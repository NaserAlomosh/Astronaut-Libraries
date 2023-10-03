import 'package:flutter/material.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: InkWell(onTap: () {}, child: const Text('ShoppingCart')),
        ),
      ),
    );
  }
}
