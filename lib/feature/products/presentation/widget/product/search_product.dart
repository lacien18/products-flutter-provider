import 'package:flutter/material.dart';
import 'package:products/core/widgets/form_fields/decorated_text_form_field.dart';

class SearchProduct extends StatelessWidget {
  const SearchProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedTextFormField(
      enabled: false,
      label: 'Busca un producto de interés',
      keyboardType: TextInputType.text,
      onChanged: (value) {},
    );
  }
}
