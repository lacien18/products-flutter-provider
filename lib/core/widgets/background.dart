import 'package:flutter/material.dart';
import 'package:products/core/resources/assets.dart';
import 'package:products/core/resources/color_app.dart';

class BackGround extends StatelessWidget {
  const BackGround({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                  ColorApp.shellBackground,
                  BlendMode.modulate,
                ),
                image: ExactAssetImage(Assets.background),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        child,
      ],
    );
  }
}
