import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:products/core/domain/entities/snackbar_type.dart';
import 'package:products/core/domain/entities/type_feed.dart';
import 'package:products/core/global_providers/user_notifier.dart';
import 'package:products/core/routes/routes.dart';
import 'package:products/core/utils/dialog_manager.dart';
import 'package:products/core/widgets/fill_buttom.dart';
import 'package:products/di/locator.dart';
import 'package:products/feature/auth/presentation/widget/form.dart';
import 'package:products/feature/auth/presentation/widget/login/other_options.dart';
import 'package:products/feature/auth/presentation/widget/custom_template.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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

  void _login(BuildContext context) {
    FocusScope.of(context).unfocus();
    final keyState = context.read<UserProvider>().formKey1;

    keyState.currentState!.save();

    if (keyState.currentState!.validate()) {
      context.read<UserProvider>().loginUser();
    }
  }

  void changeState() {
    if (mounted) {
      context.read<UserProvider>().state.maybeWhen(
          loading: (l) {
            if (l == TypeFeed.loginUser.index.toString()) {
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
            if (f == TypeFeed.loginUser) {
              GoRouter.of(context).pop();
              GoRouter.of(context).go(Routes.home.path);
            }
          },
          orElse: () {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomTemplate(
      child: Column(
        children: [
          const SizedBox(height: 30),
          const SizedBox(
            width: 100,
            height: 100,
            child: FlutterLogo(),
          ),
          const SizedBox(height: 30),
          Consumer<UserProvider>(
            builder: (context, userP, _) {
              return CustomForm(formKey: userP.formKey1);
            },
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: FillButton(
              shape: 20,
              padding: 11,
              onPressed: () => _login(context),
              label: 'Iniciar Sesión',
            ),
          ),
          const SizedBox(height: 10),
          const OtherOptions()
        ],
      ),
    );
  }
}
