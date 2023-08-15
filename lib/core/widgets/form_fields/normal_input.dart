import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:products/core/resources/color_app.dart';
import 'package:products/core/theme/theme.dart';

class NormalInput extends StatefulWidget {
  const NormalInput(
      {super.key,
      this.initialValue,
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
      this.label});

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

  @override
  State<NormalInput> createState() => _NormalInputState();
}

class _NormalInputState extends State<NormalInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      maxLines: widget.maxLines,
      enabled: widget.enabled,
      focusNode: widget.focusNode,
      validator: widget.validator,
      initialValue: widget.initialValue,
      onChanged: widget.onChanged,
      onSaved: widget.onSaved,
      onFieldSubmitted: widget.onFieldSubmitted,
      obscureText: widget.obscureText,
      textCapitalization: widget.textCapitalization,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      style: TextStyle(
        color: widget.enabled ? widget.colorBorder : null,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(
          left: 10,
          right: 10,
          top: 8,
          bottom: 8,
        ),
        labelText: widget.label,
        labelStyle: AppTheme.theme.textTheme.bodySmall
            ?.copyWith(color: ColorApp.hint, fontSize: 13),
        hintText: widget.hintText,
        hintStyle: AppTheme.theme.textTheme.bodySmall?.copyWith(
          fontSize: 14.0,
          color: widget.colorBorder ?? ColorApp.hint,
        ),
        isDense: true,
        border: _buildBorder(),
        enabledBorder: _buildBorder(),
        disabledBorder: _buildBorder(),
        focusedBorder: _buildBorder(),
        errorBorder: _buildErrorBorder(),
        focusedErrorBorder: _buildErrorBorder(),
      ),
      inputFormatters: widget.inputFormatters,
    );
  }

  InputBorder _buildBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: widget.colorBorder != null ? widget.colorBorder! : ColorApp.hint,
      ),
      borderRadius: BorderRadius.circular(20.0),
    );
  }

  InputBorder _buildErrorBorder() {
    const color = ColorApp.error;
    return OutlineInputBorder(
      borderSide: const BorderSide(color: color),
      borderRadius: BorderRadius.circular(10.0),
    );
  }
}
