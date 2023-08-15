import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:products/core/domain/entities/products_model.dart';
import 'package:products/core/error/exception.dart';
import 'package:products/feature/products/data/services/product_services.dart';

@LazySingleton(as: ProductServices)
class ProductServicesImpl implements ProductServices {
  ProductServicesImpl(this.fireStore);

  final FirebaseFirestore fireStore;
  String dbProducts = 'products';

  @override
  Stream<QuerySnapshot> get products => _getAllProducts();

  Stream<QuerySnapshot> _getAllProducts() {
    return fireStore.collection(dbProducts).snapshots();
  }

  @override
  Future<ProductModel?> createProduct(ProductModel? product) async {
    try {
      final data = product!.toCreate();

      await fireStore.collection(dbProducts).doc(data['id']).set(data);

      return product;
    } on FirebaseAuthException catch (e) {
      throw AppException.custom(e.message!);
    } on PlatformException catch (e) {
      throw AppException.custom(e.message!);
    }
  }

  @override
  Future<ProductModel?> updateProduct(ProductModel? product) async {
    try {
      final data = product!.toJson();

      await fireStore.collection(dbProducts).doc(product.id).update(data);

      return product;
    } on FirebaseAuthException catch (e) {
      throw AppException.custom(e.message!);
    } on PlatformException catch (e) {
      throw AppException.custom(e.message!);
    }
  }

  @override
  Future<ProductModel?> deleteProduct(String? idProduct) async {
    try {
      await fireStore.collection(dbProducts).doc(idProduct).delete();

      return ProductModel();
    } on FirebaseAuthException catch (e) {
      throw AppException.custom(e.message!);
    } on PlatformException catch (e) {
      throw AppException.custom(e.message!);
    }
  }
}
