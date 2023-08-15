import 'package:dartz/dartz.dart';
import 'package:products/core/domain/entities/products_model.dart';
import 'package:products/core/error/failure.dart';

abstract class ProductRepository {
  Future<Either<Failure, ProductModel?>> createProduct(ProductModel? product);
  Future<Either<Failure, ProductModel?>> deleteProduct(String? idProduct);
  Future<Either<Failure, ProductModel?>> updateProduct(ProductModel? product);
}
