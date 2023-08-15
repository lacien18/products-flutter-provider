import 'package:flutter/material.dart';
import 'package:products/core/utils/dialog_manager.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () => DialogManager.showCommingSoon(context),
          child: const Icon(Icons.menu_sharp),
        ),
        InkWell(
          onTap: () => DialogManager.showCommingSoon(context),
          child: const CircleAvatar(
            child: Icon(
              Icons.shopify_sharp,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
