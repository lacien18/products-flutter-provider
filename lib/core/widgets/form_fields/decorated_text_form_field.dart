import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:products/core/widgets/form_fields/normal_input.dart';
import 'package:products/core/widgets/form_fields/password_input.dart';

class DecoratedTextFormField extends StatefulWidget {
  final String? initialValue;
  final String? hintText;
  final bool obscureText;
  final bool enabled;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final ValueChanged<String?>? onChanged;
  final ValueChanged<String?>? onSaved;
  final ValueChanged<String?>? onFieldSubmitted;
  final FormFieldValidator<String?>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final int maxLines;
  final Color? colorBorder;
  final bool typePassword;
  final TextEditingController? controller;
  final String? label;

  const DecoratedTextFormField({
    Key? key,
    this.initialValue,
    this.label,
    this.hintText,
    this.obscureText = false,
    this.enabled = true,
    this.focusNode,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.onChanged,
    this.onSaved,
    this.onFieldSubmitted,
    this.validator,
    this.inputFormatters,
    this.maxLines = 1,
    this.colorBorder,
    this.typePassword = false,
    this.controller,
  }) : super(key: key);

  @override
  State<DecoratedTextFormField> createState() => _DecoratedTextFormFieldState();
}

class _DecoratedTextFormFieldState extends State<DecoratedTextFormField> {
  bool _isVisivility = false;

  @override
  void initState() {
    _isVisivility = widget.typePassword;
    super.initState();
  }

  void showPass() {
    setState(
      () => _isVisivility ? _isVisivility = false : _isVisivility = true,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: widget.typePassword
          ? PasswordInput(
              showPass: () => showPass(),
              controller: widget.controller,
              maxLines: widget.maxLines,
              enabled: widget.enabled,
              focusNode: widget.focusNode,
              validator: widget.validator,
              initialValue: widget.initialValue,
              onChanged: widget.onChanged,
              onSaved: widget.onSaved,
              onFieldSubmitted: widget.onFieldSubmitted,
              obscureText: _isVisivility,
              textCapitalization: widget.textCapitalization,
              keyboardType: widget.keyboardType,
              textInputAction: widget.textInputAction,
            )
          : NormalInput(
              label: widget.label,
              controller: widget.controller,
              maxLines: widget.maxLines,
              enabled: widget.enabled,
              focusNode: widget.focusNode,
              validator: widget.validator,
              initialValue: widget.initialValue,
              onChanged: widget.onChanged,
              onSaved: widget.onSaved,
              onFieldSubmitted: widget.onFieldSubmitted,
              obscureText: _isVisivility,
              textCapitalization: widget.textCapitalization,
              keyboardType: widget.keyboardType,
              textInputAction: widget.textInputAction,
            ),
    );
  }
}
