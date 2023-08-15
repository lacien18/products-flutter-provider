import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:products/core/resources/color_app.dart';
import 'package:products/core/routes/routes.dart';
import 'package:products/core/theme/theme.dart';
import 'package:products/core/utils/dialog_manager.dart';

class OtherOptions extends StatelessWidget {
  const OtherOptions({super.key});

  void _goToRegister(BuildContext context) {
    GoRouter.of(context).pushNamed(Routes.register.name);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        TextButton(
          onPressed: () => DialogManager.showCommingSoon(context),
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(
              Colors.transparent,
            ),
            padding: MaterialStateProperty.all(
              const EdgeInsets.all(0),
            ),
          ),
          child: Text(
            '¿Se te olvido tu contraseña?',
            style: AppTheme.theme.textTheme.bodySmall?.copyWith(
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Text(
            '¿Aún no tienes una cuenta con nosotros?',
            textAlign: TextAlign.center,
            style: AppTheme.theme.textTheme.bodySmall?.copyWith(),
          ),
        ),
        TextButton(
          onPressed: () => _goToRegister(context),
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(
              Colors.transparent,
            ),
            padding: MaterialStateProperty.all(
              const EdgeInsets.all(0),
            ),
          ),
          child: Text(
            ' Regístrate Aquí',
            style: AppTheme.theme.textTheme.bodyLarge?.copyWith(
              fontSize: 16,
              color: ColorApp.shellBackground,
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
