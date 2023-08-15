import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:products/core/domain/entities/products_model.dart';
import 'package:products/core/error/failure.dart';
import 'package:products/core/utils/base_repository.dart';
import 'package:products/feature/products/data/domain/repositories/product_repository.dart';
import 'package:products/feature/products/data/services/product_services.dart';

@LazySingleton(as: ProductRepository)
class ProductRepositoryImpl extends BaseRepository
    implements ProductRepository {

  ProductRepositoryImpl(this._productServices);

  final ProductServices _productServices;

  @override
  Future<Either<Failure, ProductModel?>> createProduct(ProductModel? product) async {
    return runCatching(() async {
      final success = await _productServices.createProduct(product);
      return Right(success);
    });
  }

   @override
  Future<Either<Failure, ProductModel?>> updateProduct(ProductModel? product) async {
    return runCatching(() async {
      final success = await _productServices.updateProduct(product);
      return Right(success);
    });
  }

   @override
  Future<Either<Failure, ProductModel?>> deleteProduct(String? idProduct) async {
    return runCatching(() async {
      final success = await _productServices.deleteProduct(idProduct);
      return Right(success);
    });
  }
}
