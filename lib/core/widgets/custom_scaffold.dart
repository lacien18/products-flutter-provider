import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:products/core/routes/routes.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    required this.child,
    this.bg = Colors.white,
    this.showAddProduct = false,
  });

  final Widget child;
  final Color? bg;
  final bool showAddProduct;

  void _goToAddProduct(BuildContext context) {
    GoRouter.of(context).pushNamed(
      Routes.addEditProduct.name,
      pathParameters: {'product': "{}"},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: child,
      floatingActionButton: showAddProduct
          ? FloatingActionButton(
              onPressed: () => _goToAddProduct(context),
              elevation: 5,
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}
