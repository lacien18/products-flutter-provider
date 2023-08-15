
import 'package:flutter/material.dart';
import 'package:products/core/resources/color_app.dart';

enum SnackBarType {
  error,
  warning,
  success,
}

class SnackBarUtil {
  final IconData icon;
  final Color color;
  SnackBarUtil({required this.icon, required this.color});
}

extension SnackBarTypeExtensions on SnackBarType {
  SnackBarUtil get value {
    switch (this) {
      case SnackBarType.error:
        return SnackBarUtil(
          color: ColorApp.error,
          icon: Icons.error_outline_sharp,
        );
      case SnackBarType.success:
        return SnackBarUtil(
          color: ColorApp.success,
          icon: Icons.check_circle_sharp,
        );
      case SnackBarType.warning:
        return SnackBarUtil(
          color: Colors.orangeAccent.shade700,
          icon: Icons.warning_amber_rounded,
        );
    }
  }
}
