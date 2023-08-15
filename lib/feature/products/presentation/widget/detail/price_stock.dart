import 'package:flutter/material.dart';
import 'package:products/core/domain/entities/products_model.dart';
import 'package:products/core/theme/theme.dart';
import 'package:products/core/utils/format_price.dart';

class PriceStock extends StatelessWidget {
  const PriceStock({super.key, required this.product});

  final ProductModel product;
  final na = "N/A";

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          product.price != null
              ? CurrencyHelper.formatNumber(product.price!)
              : na,
          style: AppTheme.theme.textTheme.bodyMedium?.copyWith(fontSize: 18),
        ),
        Text(
          'Disponible ${product.stock ?? na}',
          style: AppTheme.theme.textTheme.bodySmall?.copyWith(fontSize: 18),
        ),
      ],
    );
  }
}
