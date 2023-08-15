import 'package:flutter/material.dart';
import 'package:products/core/resources/color_app.dart';
import 'package:products/core/resources/fonts.dart';

class DisabledTextField extends StatelessWidget {
  final String? labelText;
  final String? errorText;
  final IconData icon;
  final TextEditingController? controller;
  final VoidCallback? onTap;

  const DisabledTextField({
    Key? key,
    @required this.labelText,
    this.errorText,
    this.icon = Icons.keyboard_arrow_down,
    this.controller,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: TextField(
        controller: controller,
        enabled: false,
        style: const TextStyle(
          fontFamily: Fonts.app,
        ),
        decoration: InputDecoration(
          hintText: labelText,
          errorText: errorText,
          isDense: true,
          hintStyle: const TextStyle(
            fontSize: 14.0,
            color: ColorApp.hint,
          ),
          contentPadding: const EdgeInsets.all(10),
          errorStyle: TextStyle(color: theme.colorScheme.error),
          border: _buildBorder(context),
          disabledBorder: _buildBorder(context),
          errorBorder: _buildErrorBorder(context),
          suffixIcon: Icon(
            icon,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  InputBorder _buildBorder(BuildContext context) {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: ColorApp.hint,
      ),
      borderRadius: BorderRadius.circular(20.0),
    );
  }

  InputBorder _buildErrorBorder(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.colorScheme.error;
    return OutlineInputBorder(
      borderSide: BorderSide(color: color),
      borderRadius: BorderRadius.circular(20.0),
    );
  }
}
