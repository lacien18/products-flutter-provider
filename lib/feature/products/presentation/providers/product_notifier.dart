import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:products/core/domain/entities/products_model.dart';
import 'package:products/core/domain/entities/type_feed.dart';
import 'package:products/core/utils/state_app/state_app.dart';
import 'package:products/feature/products/data/domain/repositories/product_repository.dart';

@injectable
class ProductProvider extends ChangeNotifier {
  ProductProvider(this._productRepository);

  final ProductRepository _productRepository;
  final formKey = GlobalKey<FormState>();

  ProductModel product = ProductModel();

  StateApp<ProductModel?> _state = const StateApp.initial();

  StateApp<ProductModel?> get state {
    return _state;
  }

  Future<void> createProduct() async {
    _state = StateApp.loading(message: TypeFeed.createProduct.index.toString());

    notifyListeners();

    final result = await _productRepository.createProduct(product);

    _state = result.fold<StateApp<ProductModel?>>(
      (failure) => StateApp.failure(failure),
      (r) {
        product = ProductModel();
        return StateApp.success(r, feed: TypeFeed.createProduct);
      },
    );
    notifyListeners();
  }

  Future<void> updateProduct() async {
    _state = StateApp.loading(message: TypeFeed.updateProduct.index.toString());

    notifyListeners();

    final result = await _productRepository.updateProduct(product);

    _state = result.fold<StateApp<ProductModel?>>(
      (failure) => StateApp.failure(failure),
      (r) => StateApp.success(r, feed: TypeFeed.updateProduct),
    );
    notifyListeners();
  }

  Future<void> deleteProduct() async {
    _state = StateApp.loading(message: TypeFeed.deleteProduct.index.toString());

    notifyListeners();

    final result = await _productRepository.deleteProduct(product.id);

    _state = result.fold<StateApp<ProductModel?>>(
      (failure) => StateApp.failure(failure),
      (r) => StateApp.success(r, feed: TypeFeed.deleteProduct),
    );
    notifyListeners();
  }
}
