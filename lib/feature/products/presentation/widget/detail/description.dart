import 'package:flutter/material.dart';
import 'package:products/core/domain/entities/products_model.dart';
import 'package:products/core/theme/theme.dart';

class Description extends StatelessWidget {
  const Description({super.key, required this.product});

  final ProductModel product;
  final na = "N/A";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        const SizedBox(height: 10),
        Text(
          'Descripcion',
          style: AppTheme.theme.textTheme.bodySmall?.copyWith(fontSize: 18),
        ),
        const SizedBox(height: 10),
        Text(
          product.description ?? na,
          textAlign: TextAlign.justify,
          maxLines: 10,
          style: AppTheme.theme.textTheme.bodySmall?.copyWith(
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(height: 10),
        const Divider(),
      ],
    );
  }
}
