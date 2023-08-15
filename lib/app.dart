import 'package:flutter/material.dart';
import 'package:products/core/global_providers/user_notifier.dart';
import 'package:products/core/routes/router.dart';
import 'package:products/di/locator.dart';
import 'package:products/feature/products/presentation/providers/product_notifier.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  List<ChangeNotifierProvider> _createProviders() {
    return [
      ChangeNotifierProvider<UserProvider>(
        create: (_) => sl(),
        lazy: false,
      ),
      ChangeNotifierProvider<ProductProvider>(
        create: (_) => sl(),
        lazy: false,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: _createProviders(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Products',
        routerConfig: RouterApp.router,
      ),
    );
  }
}
