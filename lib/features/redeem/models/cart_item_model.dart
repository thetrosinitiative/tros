import 'dart:convert';

// import 'package:flutter/foundation.dart';

class CartItemModel {
  String productId;
  String title;
  double price;
  String? image;
  int quantity;

  CartItemModel({
    required this.productId,
    this.title = '',
    this.price = 0.0,
    this.image,
    required this.quantity,
  });

  CartItemModel copyWith({
    String? productId,
    String? title,
    double? price,
    String? image,
    int? quantity,
  }) {
    return CartItemModel(
      productId: productId ?? this.productId,
      title: title ?? this.title,
      price: price ?? this.price,
      image: image ?? this.image,
      quantity: quantity ?? this.quantity,
    );
  }

  static CartItemModel empty() => CartItemModel(
        productId: '',
        title: '',
        price: 0.0,
        quantity: 0,
      );
  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'productId': productId});
    result.addAll({'title': title});
    result.addAll({'price': price});
    if (image != null) {
      result.addAll({'image': image});
    }
    result.addAll({'quantity': quantity});

    return result;
  }

  factory CartItemModel.fromMap(Map<String, dynamic> map) {
    return CartItemModel(
      productId: map['productId'] ?? '',
      title: map['title'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      image: map['image'],
      quantity: map['quantity']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartItemModel.fromJson(String source) =>
      CartItemModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CartItemModel(productId: $productId, title: $title, price: $price, image: $image, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CartItemModel &&
        other.productId == productId &&
        other.title == title &&
        other.price == price &&
        other.image == image &&
        other.quantity == quantity;
  }

  @override
  int get hashCode {
    return productId.hashCode ^
        title.hashCode ^
        price.hashCode ^
        image.hashCode ^
        quantity.hashCode;
  }
}
