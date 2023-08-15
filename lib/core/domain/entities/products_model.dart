import 'package:uuid/uuid.dart';

class ProductModel {
  String? name;
  String? id;
  String? description;
  int? stock;
  int? price;

  ProductModel({this.id, this.description, this.name, this.price, this.stock});

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        name: (json["name"] == null) ? null : json["name"],
        description: (json["description"] == null) ? null : json["description"],
        stock: (json["stock"] == null) ? null : json["stock"],
        price: (json["price"] == null) ? null : json["price"],
        id: (json["id"] == null) ? null : json["id"],
      );

  Map<String, dynamic> toCreate() {
    const uuid = Uuid();
    final v4 = uuid.v4();

    return {
      'name': name,
      'description': description,
      'id': v4,
      'stock': stock,
      'price': price
    };
  }

  Map<String, dynamic> toJson() => {
        if (name != null) 'name': name,
        if (description != null) 'description': description,
        if (id != null) 'id': id,
        if (stock != null) 'stock': stock,
        if (price != null) 'price': price
      };
}
