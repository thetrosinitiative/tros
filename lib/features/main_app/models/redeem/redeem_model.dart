import 'dart:convert';

class ProductModel {
  String id;
  String name;
  String description;
  int price;
  int size;
  int stock;
  String image;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.size,
    required this.stock,
    required this.image,
  });

  ProductModel copyWith({
    String? id,
    String? name,
    String? description,
    int? price,
    int? size,
    int? stock,
    String? image,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      size: size ?? this.size,
      stock: stock ?? this.stock,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'description': description});
    result.addAll({'price': price});
    result.addAll({'size': size});
    result.addAll({'stock': stock});
    result.addAll({'image': image});

    return result;
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      price: map['price']?.toInt() ?? 0,
      size: map['size']?.toInt() ?? 0,
      stock: map['stock']?.toInt() ?? 0,
      image: map['image'] ?? '',
    );
  }

  static ProductModel empty() => ProductModel(
      id: '',
      name: '',
      description: '',
      price: 0,
      size: 0,
      stock: 0,
      image: '');

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductModel(id: $id, name: $name, description: $description, price: $price, size: $size, stock: $stock, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductModel &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        other.price == price &&
        other.size == size &&
        other.stock == stock &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        price.hashCode ^
        size.hashCode ^
        stock.hashCode ^
        image.hashCode;
  }
}
