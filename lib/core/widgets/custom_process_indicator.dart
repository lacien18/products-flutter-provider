import 'package:flutter/material.dart';
import 'package:products/core/resources/color_app.dart';

class CustomProcessIndicator extends StatelessWidget {
  const CustomProcessIndicator({super.key, this.top = 0.0});

  final double top;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: top),
      height: 40,
      width: 10,
      child: const Center(
        child: CircularProgressIndicator(
          color: ColorApp.success,
        ),
      ),
    );
  }
}
