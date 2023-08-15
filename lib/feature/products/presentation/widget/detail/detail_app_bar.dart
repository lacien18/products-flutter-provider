import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:products/core/domain/entities/snackbar_type.dart';
import 'package:products/core/domain/entities/type_feed.dart';
import 'package:products/core/resources/color_app.dart';
import 'package:products/core/routes/routes.dart';
import 'package:products/core/utils/dialog_manager.dart';
import 'package:products/di/locator.dart';
import 'package:products/feature/products/presentation/providers/product_notifier.dart';
import 'package:provider/provider.dart';

class DetailAppBar extends StatefulWidget {
  const DetailAppBar({super.key});

  @override
  State<DetailAppBar> createState() => _DetailAppBarState();
}

class _DetailAppBarState extends State<DetailAppBar> {
  void _goToEditProduct(BuildContext context) {
    final product = context.read<ProductProvider>().product;

    GoRouter.of(context).pushNamed(
      Routes.addEditProduct.name,
      pathParameters: {
        'product': jsonEncode(product.toJson()),
      },
    );
  }

  @override
  void initState() {
    context.read<ProductProvider>().addListener(changeState);
    super.initState();
  }

  @override
  void dispose() {
    sl<ProductProvider>().removeListener(changeState);
    sl<ProductProvider>().dispose();

    super.dispose();
  }

  void changeState() {
    if (mounted) {
      context.read<ProductProvider>().state.maybeWhen(
          loading: (l) {
            if (l == TypeFeed.deleteProduct.index.toString()) {
              DialogManager.showMyDialog(context);
            }
          },
          failure: (f) {
            GoRouter.of(context).pop();
            DialogManager.snackBar(
              context,
              SnackBarType.error,
              message: f.message,
            );
          },
          success: (s, f) {
            if (f == TypeFeed.deleteProduct) {
              GoRouter.of(context).pop();
              GoRouter.of(context).pop();

              DialogManager.snackBar(
                context,
                SnackBarType.success,
                message: 'Producto eliminado',
              );
            }
          },
          orElse: () {});
    }
  }

  void _deleteProduct(BuildContext context) {
    DialogManager.showConfirm(
      context,
      message: '¿Esá segudo de que desea eliminar este producto?',
      onConfirm: () {
        GoRouter.of(context).pop();
        context.read<ProductProvider>().deleteProduct();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const BackButton(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () => _goToEditProduct(context),
              icon: Icon(
                Icons.edit,
                color: ColorApp.normal,
              ),
            ),
            IconButton(
              onPressed: () => _deleteProduct(context),
              icon: const Icon(
                Icons.delete,
                color: ColorApp.error,
              ),
            ),
          ],
        )
      ],
    );
  }
}
