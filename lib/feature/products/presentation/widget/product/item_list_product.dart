import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:products/core/domain/entities/products_model.dart';
import 'package:products/core/resources/color_app.dart';
import 'package:products/core/routes/routes.dart';
import 'package:products/core/theme/theme.dart';
import 'package:products/core/utils/format_price.dart';
import 'package:products/feature/products/presentation/providers/product_notifier.dart';
import 'package:provider/provider.dart';

class ItemListProduct extends StatelessWidget {
  const ItemListProduct({super.key, required this.product});

  final ProductModel product;
  final na = 'N/A';

  void _goToProduct(BuildContext context) {
    context.read<ProductProvider>().product = product;

    GoRouter.of(context).pushNamed(
      Routes.detailProduct.name,
      pathParameters: {
        'product': jsonEncode(product.toJson()),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _goToProduct(context),
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.center,
                child: Icon(
                  Icons.image,
                  size: 90,
                  color: ColorApp.shadow,
                ),
              ),
              const SizedBox(height: 30),
              Text(
                product.name ?? na,
                maxLines: 2,
                style: AppTheme.theme.textTheme.bodySmall
                    ?.copyWith(overflow: TextOverflow.ellipsis),
              ),
              const SizedBox(height: 10),
              if (product.price != null)
                Text(
                  CurrencyHelper.formatNumber(product.price!),
                  style: AppTheme.theme.textTheme.bodyMedium
                      ?.copyWith(fontSize: 18),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
