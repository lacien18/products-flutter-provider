import 'package:flutter/material.dart';
import 'package:products/core/widgets/custom_scaffold.dart';
import 'package:products/feature/products/presentation/widget/app_bar.dart';
import 'package:products/feature/products/presentation/widget/product/greetings.dart';
import 'package:products/feature/products/presentation/widget/product/list_products.dart';
import 'package:products/feature/products/presentation/widget/product/search_product.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      showAddProduct: true,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              CustomAppBar(),
              SizedBox(height: 30),
              Greetings(),
              SizedBox(height: 50),
              SearchProduct(),
              SizedBox(height: 20),
              ListProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
