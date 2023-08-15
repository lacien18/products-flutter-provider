import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:products/core/domain/entities/snackbar_type.dart';
import 'package:products/core/domain/entities/type_feed.dart';
import 'package:products/core/global_providers/user_notifier.dart';
import 'package:products/core/theme/theme.dart';
import 'package:products/core/utils/dialog_manager.dart';
import 'package:products/core/widgets/fill_buttom.dart';
import 'package:products/di/locator.dart';
import 'package:products/feature/auth/presentation/widget/custom_template.dart';
import 'package:products/feature/auth/presentation/widget/form.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  void initState() {
    context.read<UserProvider>().addListener(changeState);
    super.initState();
  }

  @override
  void dispose() {
    sl<UserProvider>().removeListener(changeState);
    sl<UserProvider>().dispose();

    super.dispose();
  }

  void _register(BuildContext context) {
    FocusScope.of(context).unfocus();
    final keyState = context.read<UserProvider>().formKey2;

    keyState.currentState!.save();

    if (keyState.currentState!.validate()) {
      context.read<UserProvider>().createUser();
    }
  }

  void changeState() {
    if (mounted) {
      context.read<UserProvider>().state.maybeWhen(
          loading: (l) {
            if (l == TypeFeed.createdUser.index.toString()) {
              DialogManager.showMyDialog(context);
            }
          },
          failure: (f) {
            GoRouter.of(context).pop();
            DialogManager.snackBar(
              context,
              SnackBarType.error,
              message: f.message,
            );
          },
          success: (s, f) {
            if (f == TypeFeed.createdUser) {
              GoRouter.of(context).pop();
              GoRouter.of(context).pop();

              DialogManager.snackBar(
                context,
                SnackBarType.success,
                message: 'Registro Exitoso',
              );
            }
          },
          orElse: () {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomTemplate(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: BackButton(),
          ),
          const SizedBox(height: 30),
          Text(
            'Registrate',
            style: AppTheme.theme.textTheme.bodyLarge?.copyWith(
              fontSize: 27,
            ),
          ),
          const SizedBox(height: 40),
          Consumer<UserProvider>(
            builder: (context, userP, _) {
              return CustomForm(formKey: userP.formKey2);
            },
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: FillButton(
              shape: 20,
              padding: 11,
              onPressed: () => _register(context),
              label: 'Registrarme',
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
