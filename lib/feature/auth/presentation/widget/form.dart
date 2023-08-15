import 'package:flutter/material.dart';
import 'package:products/core/global_providers/user_notifier.dart';
import 'package:products/core/theme/theme.dart';
import 'package:products/core/utils/validators.dart';
import 'package:products/core/utils/white_space_text_input_formatter.dart';
import 'package:products/core/widgets/form_fields/decorated_text_form_field.dart';
import 'package:provider/provider.dart';

class CustomForm extends StatelessWidget {
  const CustomForm({super.key, required this.formKey});

  final GlobalKey formKey;

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Form(
      key: formKey,
      child: Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(
              'Correo electrónico',
              style: AppTheme.theme.textTheme.bodyMedium?.copyWith(),
            ),
            const SizedBox(height: 10),
            DecoratedTextFormField(
              hintText: '',
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              onChanged: (value) {
                userProvider.credencials.email = value;
              },
              inputFormatters: [WhiteSpaceTextInputFormatter()],
              validator: validateWith(EmailFormFieldValidator()),
            ),
            const SizedBox(height: 10),
            Text(
              'Contraseña',
              style: AppTheme.theme.textTheme.bodyMedium?.copyWith(),
            ),
            const SizedBox(height: 10),
            DecoratedTextFormField(
              hintText: '',
              keyboardType: TextInputType.text,
              typePassword: true,
              onChanged: (value) {
                userProvider.credencials.password = value;
              },
              inputFormatters: [WhiteSpaceTextInputFormatter()],
              validator: validateWith(PasswordFormFieldValidator()),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
