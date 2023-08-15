import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:products/core/domain/entities/products_model.dart';
import 'package:products/core/error/error_message.dart';
import 'package:products/core/widgets/custom_process_indicator.dart';
import 'package:products/core/widgets/feedback_view.dart';
import 'package:products/di/locator.dart';
import 'package:products/feature/products/data/services/product_services.dart';
import 'package:products/feature/products/presentation/widget/product/item_list_product.dart';

class ListProducts extends StatefulWidget {
  const ListProducts({super.key});

  @override
  State<ListProducts> createState() => _ListProductsState();
}

class _ListProductsState extends State<ListProducts> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder<QuerySnapshot>(
        stream: sl<ProductServices>().products,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const FeedBackView(
              top: 0,
              label: ErrorMessages.general,
              icon: Icons.error_outline_sharp,
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CustomProcessIndicator();
          }

          if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
            return const FeedBackView(
              top: 0,
              label: 'No hay productos en el inventario',
              icon: Icons.error_outline_sharp,
            );
          }

          return GridView.builder(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            physics: const BouncingScrollPhysics(),
            itemCount: snapshot.data!.docs.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              mainAxisExtent: 220,
            ),
            itemBuilder: (_, index) {
              final productDoc = snapshot.data!.docs[index];

              Map<String, dynamic> productData =
                  productDoc.data()! as Map<String, dynamic>;

              final product = ProductModel.fromJson(productData);

              return ItemListProduct(product: product);
            },
          );
        },
      ),
    );
  }
}
