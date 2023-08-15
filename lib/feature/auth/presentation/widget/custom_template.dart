import 'package:flutter/material.dart';
import 'package:products/core/widgets/background.dart';
import 'package:products/core/widgets/custom_scaffold.dart';
import 'package:products/feature/auth/presentation/widget/card.dart';

class CustomTemplate extends StatelessWidget {
  const CustomTemplate({super.key,required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: BackGround(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: CustomCard(child: child,),
        ),
      ),
    );
  }
}
