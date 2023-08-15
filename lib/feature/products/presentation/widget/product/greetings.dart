import 'package:flutter/material.dart';
import 'package:products/core/theme/theme.dart';

class Greetings extends StatelessWidget {
  const Greetings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hola!',
          style: AppTheme.theme.textTheme.bodyLarge?.copyWith(
            fontSize: 27,
          ),
        ),
        Text(
          'disfruta de los productos que tenemos para ti',
          style: AppTheme.theme.textTheme.bodySmall?.copyWith(fontSize: 20),
        ),
      ],
    );
  }
}
