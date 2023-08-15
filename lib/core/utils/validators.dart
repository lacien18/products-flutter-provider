import 'package:flutter/material.dart';

FormFieldValidator<T> validateWith<T>(FormFieldValidatorHandler<T> handler) =>
    handler.validator;

abstract class PatternValidators {

  static bool containsOnlyNumbers(String? value) {
    if (value != null && value.isNotEmpty) {
      const pattern = r'^[0-9]*$';
      final RegExp regExp = RegExp(pattern);
      return regExp.hasMatch(value);
    } else {
      return false;
    }
  }

  static bool isValidEmail(String? value) {
    if (value != null && value.isNotEmpty) {
      const pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      final regExp = RegExp(pattern);
      return regExp.hasMatch(value);
    } else {
      return false;
    }
  }
}

abstract class FormFieldValidatorHandler<T> {
  final FormFieldValidator<T> validator;

  FormFieldValidatorHandler(this.validator);
}

class NumericFormFieldValidator extends FormFieldValidatorHandler<String> {
  NumericFormFieldValidator({
    int? maxLength,
    String errorText = 'Sólo números',
  }) : super((value) {
          if (PatternValidators.containsOnlyNumbers(value)) {
            return null;
          } else {
            return errorText;
          }
        });
}

class EmailFormFieldValidator extends FormFieldValidatorHandler<String> {
  EmailFormFieldValidator()
      : super((value) {
          if (value == null || value.isEmpty) {
            return 'Ingresa un correo electrónico';
          } else if (PatternValidators.isValidEmail(value)) {
            return null;
          } else {
            return 'Ingresa un correo válido';
          }
        });
}

class PasswordFormFieldValidator extends FormFieldValidatorHandler<String> {
  PasswordFormFieldValidator()
      : super((value) {
          if (value == null || value.isEmpty) {
            return 'Ingresa tu contraseña';
          } else if (value.length < 6) {
            return 'debe tener minimo de 6 caracteres';
          } else {
            return null;
          }
        });
}

class TextFormFieldValidator extends FormFieldValidatorHandler<String> {
  TextFormFieldValidator({String errorText = 'Campo requerido'})
      : super((value) {
          if (value == null || value.isEmpty) {
            return errorText;
          } else {
            return null;
          }
        });
}

class ObjectFormFieldValidator<T> extends FormFieldValidatorHandler<T> {
  ObjectFormFieldValidator({String errorText = 'Campo requerido'})
      : super((value) {
          if (value == null) {
            return errorText;
          } else {
            return null;
          }
        });
}
