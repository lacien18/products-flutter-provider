
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:products/core/resources/color_app.dart';

class PasswordInput extends StatefulWidget {
  const PasswordInput({
    super.key,
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
    this.showPass,
  });

  final VoidCallback? showPass;
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

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.57,
            child: TextFormField(
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
                // fontFamily: Fonts.primaryFont,
                color: widget.enabled ? widget.colorBorder : null,
              ),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 8,
                  bottom: 8,
                ),
                hintText: widget.hintText,
                hintStyle: TextStyle(
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
            ),
          ),
          InkWell(
            splashColor: Colors.transparent,
            onTap: widget.showPass,
            child: Container(
              padding:
                  const EdgeInsets.only(top: 4, bottom: 4, left: 10, right: 10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: ColorApp.hint,
                  width: 1.5,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(20),
                color: widget.colorBorder ?? Colors.white,
              ),
              child: Icon(
                widget.obscureText
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: ColorApp.hint,
              ),
            ),
          )
        ],
      ),
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
