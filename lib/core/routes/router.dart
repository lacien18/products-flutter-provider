import 'dart:convert';

import 'package:go_router/go_router.dart';
import 'package:products/core/data/services/destination/destination_services.dart';
import 'package:products/core/domain/entities/products_model.dart';
import 'package:products/core/routes/routes.dart';
import 'package:products/di/locator.dart';
import 'package:products/feature/auth/presentation/view/login_view.dart';
import 'package:products/feature/auth/presentation/view/register_view.dart';
import 'package:products/feature/products/presentation/view/add_edit_product.dart';
import 'package:products/feature/products/presentation/view/detail_product_view.dart';
import 'package:products/feature/products/presentation/view/products_view.dart';

abstract class RouterApp {
  static final _router = GoRouter(
    routes: [
      GoRoute(
        path: Routes.login.path,
        name: Routes.login.name,
        builder: ((_, state) => const LoginView()),
        routes: [
          GoRoute(
            path: Routes.register.path,
            name: Routes.register.name,
            builder: ((_, __) => const RegisterView()),
          ),
        ],
      ),
      GoRoute(
        path: Routes.home.path,
        name: Routes.home.name,
        builder: ((_, state) => const ProductsView()),
        redirect: ((context, _) async {
          final destination =
              await sl<DestinationServices>().requestInitialDestination();

          return destination;
        }),
      ),
      GoRoute(
        path: Routes.detailProduct.path,
        name: Routes.detailProduct.name,
        builder: ((_, state) {
          return const DetailProductView();
        }),
      ),
      GoRoute(
        path: Routes.addEditProduct.path,
        name: Routes.addEditProduct.name,
        builder: ((_, state) {
          final prop = state.pathParameters['product'];

          final productData = jsonDecode(prop!);

          final product = ProductModel.fromJson(productData);

          return AddEditProduct(product:product);
        }),
      ),
    ],
  );

  static GoRouter get router => _router;
}
