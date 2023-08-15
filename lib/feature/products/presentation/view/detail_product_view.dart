import 'package:flutter/material.dart';
import 'package:products/core/resources/color_app.dart';
import 'package:products/core/theme/theme.dart';
import 'package:products/core/utils/dialog_manager.dart';
import 'package:products/core/widgets/custom_scaffold.dart';
import 'package:products/core/widgets/fill_buttom.dart';
import 'package:products/feature/products/presentation/providers/product_notifier.dart';
import 'package:products/feature/products/presentation/widget/detail/description.dart';
import 'package:products/feature/products/presentation/widget/detail/detail_app_bar.dart';
import 'package:products/feature/products/presentation/widget/detail/price_stock.dart';
import 'package:provider/provider.dart';

class DetailProductView extends StatelessWidget {
  const DetailProductView({super.key});

  final na = 'N/A';

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductProvider>(context).product;

    return CustomScaffold(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const DetailAppBar(),
              const SizedBox(height: 50),
              Align(
                alignment: Alignment.center,
                child: Text(
                  product.name ?? na,
                  maxLines: 2,
                  style: AppTheme.theme.textTheme.titleLarge
                      ?.copyWith(overflow: TextOverflow.ellipsis),
                ),
              ),
              const SizedBox(height: 50),
              const Align(
                alignment: Alignment.center,
                child: Icon(
                  Icons.image,
                  size: 130,
                  color: ColorApp.shadow,
                ),
              ),
              const SizedBox(height: 50),
              PriceStock(product: product),
              const SizedBox(height: 50),
              Description(product: product),
              const SizedBox(height: 50),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: FillButton(
                    shape: 20,
                    padding: 11,
                    onPressed: () => DialogManager.showCommingSoon(context),
                    label: 'Comprar',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
