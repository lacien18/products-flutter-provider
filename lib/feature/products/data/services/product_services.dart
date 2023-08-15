import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:products/core/domain/entities/products_model.dart';

abstract class ProductServices {

 Future<ProductModel?> createProduct(ProductModel? product);

 Future<ProductModel?> updateProduct(ProductModel? product);

 Future<ProductModel?> deleteProduct(String? idProduct);
 
  Stream<QuerySnapshot> get products;

}