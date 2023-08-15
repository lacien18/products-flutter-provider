import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:products/core/domain/entities/snackbar_type.dart';
import 'package:products/core/widgets/content_dialog/confirm_content.dart';
import 'package:products/core/widgets/custom_process_indicator.dart';
import 'package:products/core/widgets/fill_buttom.dart';
import 'package:products/core/widgets/snackbar_content.dart';

abstract class DialogManager {
  static Future<void> showMyDialog(
    BuildContext context,
  ) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const AlertDialog(content: CustomProcessIndicator());
      },
    );
  }

  static Future<void> showCommingSoon(
    BuildContext context, {
    String title = 'Proximamente',
  }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          content: Text(title),
          actions: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: FillButton(
                shape: 20,
                padding: 11,
                onPressed: () => GoRouter.of(context).pop(),
                label: 'OK',
              ),
            ),
          ],
        );
      },
    );
  }

  static Future<void> showConfirm(
    BuildContext context, {
    String? title = '¡Atención!',
    required String? message,
    bool dissmiss = true,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    String? textConfirm = 'Aceptar',
    String? textCancel = 'Cancelar',
    bool? showOneButtom = false,
  }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: dissmiss,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          content: ConfirmContent(
            title: title,
            message: message,
            onCancel: onCancel,
            onConfirm: onConfirm,
            textCancel: textCancel,
            textConfirm: textConfirm,
          ),
        );
      },
    );
  }

  static void snackBar(
    BuildContext context,
    SnackBarType snackBarType, {
    required String message,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        backgroundColor: snackBarType.value.color,
        content: SnackBarContent(
          message: message,
          snackBarType: snackBarType,
        ),
      ),
    );
  }
}
