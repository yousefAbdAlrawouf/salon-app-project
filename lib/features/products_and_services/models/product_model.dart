// ignore_for_file: unused_import

import 'package:salon_app/features/products_and_services/models/Categories_Model.dart';
import 'package:salon_app/features/products_and_services/models/Provider_Model.dart';



class ProductModel {
  final int id;
  final bool isFavourite;
  final int categoryId;
  final double price;
  final double discountPrice;
  final int providerId;
 // final String createdAt;
  final double deliveryFee;
  final String name;
  final String description;
  final List<dynamic> branches;
  final String image;
  // final CategoryModel? category;
  // final ProviderModel? provider;

  ProductModel({
    required this.id,
    required this.isFavourite,
    required this.categoryId,
    required this.price,
    required this.discountPrice,
    required this.providerId,
   // required this.createdAt,
    required this.deliveryFee,
    required this.name,
    required this.description,
    required this.branches,
    required this.image,
    // this.category,
    // this.provider,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      isFavourite: json['is_favourite'],
      categoryId: json['category_id'],
      price: (json['price'] as num).toDouble(),
      discountPrice: (json['discount_price'] as num).toDouble(),
      providerId: json['provider_id'],
      //createdAt: json['created_at'],
      deliveryFee: (json['delivery_fee'] as num).toDouble(),
      name: json['name'],
      description: json['description'],
      branches: json['branches'] ?? [],
      image: json['image'],
      // category: json['category'] != null
      //     ? CategoryModel.fromJson(json['category'])
      //     : null,
      // provider: json['provider'] != null
      //     ? ProviderModel.fromJson(json['provider'])
      //     : null,
    );
  }
  

  ProductModel copyWith({
    int? id,
    bool? isFavourite,
    int? categoryId,
    double? price,
    double? discountPrice,
    int? providerId,
   // String? createdAt,
    double? deliveryFee,
    String? name,
    String? description,
    List<dynamic>? branches,
    String? image,
    // CategoryModel? category,
    // ProviderModel? provider,
  }) {
    return ProductModel(
      id: id ?? this.id,
      isFavourite: isFavourite ?? this.isFavourite,
      categoryId: categoryId ?? this.categoryId,
      price: price ?? this.price,
      discountPrice: discountPrice ?? this.discountPrice,
      providerId: providerId ?? this.providerId,
     // createdAt: createdAt ?? this.createdAt,
      deliveryFee: deliveryFee ?? this.deliveryFee,
      name: name ?? this.name,
      description: description ?? this.description,
      branches: branches ?? this.branches,
      image: image ?? this.image,
      // category: category ?? this.category,
      // provider: provider ?? this.provider,
    );
  }
}



