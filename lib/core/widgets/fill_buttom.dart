import 'package:flutter/material.dart';
import 'package:products/core/resources/color_app.dart';
import 'package:products/core/theme/theme.dart';

class FillButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final Color? backgroundColor;
  final Color? textColor;
  final double? shape;
  final double padding;
  final double paddingRL;
  final bool isCenter;
  final double fontSize;
  const FillButton({
    Key? key,
    required this.label,
    this.onPressed,
    this.backgroundColor = ColorApp.shellBackground,
    this.shape = 15,
    this.padding = 13,
    this.isCenter = true,
    this.textColor = Colors.white,
    this.fontSize = 16,
    this.paddingRL = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          EdgeInsets.only(
            top: padding,
            bottom: padding,
            left: paddingRL,
            right: paddingRL,
          ),
        ),
        backgroundColor: MaterialStateProperty.all(backgroundColor),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                shape!,
              ),
            ),
          ),
        ),
      ),
      child: Text(
        label,
        textAlign: isCenter ? TextAlign.center : null,
        style: AppTheme.theme.textTheme.bodyMedium?.copyWith(
          color: textColor,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
