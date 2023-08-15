import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:products/core/theme/theme.dart';
import 'package:products/core/widgets/fill_buttom.dart';

class ConfirmContent extends StatelessWidget {
  const ConfirmContent({
    super.key,
    required this.message,
    this.onCancel,
    this.onConfirm,
    this.textCancel = 'Cancelar',
    this.textConfirm = 'Aceptar',
    this.title = '¡Atención!',
  });

  final String? title;
  final String? message;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final String? textConfirm;
  final String? textCancel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title!,
          textAlign: TextAlign.center,
          style: AppTheme.theme.textTheme.bodyLarge!.copyWith(
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 30),
        Text(
          message!,
          textAlign: TextAlign.center,
          style: AppTheme.theme.textTheme.bodySmall?.copyWith(
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: FillButton(
            label: textConfirm!,
            fontSize: 16,
            onPressed: onConfirm ?? () => GoRouter.of(context).pop(),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: FillButton(
            label: textCancel!,
            fontSize: 16,
            onPressed: onCancel ?? () => GoRouter.of(context).pop(),
          ),
        ),
      ],
    );
  }
}
