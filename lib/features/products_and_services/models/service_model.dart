// ignore_for_file: unused_import

import 'package:salon_app/features/products_and_services/models/Categories_Model.dart';
import 'package:salon_app/features/products_and_services/models/Provider_Model.dart';



class ServiceModel {
  final int id;
  final bool isFavourite;
  final int categoryId;
  final double price;
  final double new_price;
  final int home_service_fee;
 // final String createdAt;
  //final double? deliveryFee;
  final String name;
  final String description;
  //final List<dynamic> branches;
  final String image;
  // final CategoryModel? category;
  // final ProviderModel? provider;


  ServiceModel({
    required this.id,
    required this.isFavourite,
    required this.categoryId,
    required this.price,
    required this.new_price,
    required this.home_service_fee,
   // required this.createdAt,
    //required this.deliveryFee,
    required this.name,
    required this.description,
    //required this.branches,
    required this.image,
    // this.category,
    // this.provider,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['id'],
      isFavourite: json['is_favourite'],
      categoryId: json['category_id'],
      price: (json['price'] as num).toDouble(),
      new_price: (json['new_price'] ?? 0 as num ).toDouble(),
      home_service_fee: json['home_service_fee'],
      //createdAt: json['created_at'],
      //deliveryFee: (json['delivery_fee'] as num).toDouble(),
      name: json['name'],
      description: json['description'],
      //branches: json['branches'] ?? [],
      image: json['image'],
      // category: json['category'] != null
      //     ? CategoryModel.fromJson(json['category'])
      //     : null,
      // provider: json['provider'] != null
      //     ? ProviderModel.fromJson(json['provider'])
      //     : null,
    );
  }
  

  ServiceModel copyWith({
    int? id,
    bool? isFavourite,
    int? categoryId,
    double? price,
    double? new_price,
    int? home_service_fee,
   // String? createdAt,
   // double? deliveryFee,
    String? name,
    String? description,
    //List<dynamic>? branches,
    String? image,
    // CategoryModel? category,
    // ProviderModel? provider,
  }) {
    return ServiceModel(
      id: id ?? this.id,
      isFavourite: isFavourite ?? this.isFavourite,
      categoryId: categoryId ?? this.categoryId,
      price: price ?? this.price,
      new_price: new_price ?? this.new_price,
      home_service_fee: home_service_fee ?? this.home_service_fee,
     // createdAt: createdAt ?? this.createdAt,
     // deliveryFee: deliveryFee ?? this.deliveryFee,
      name: name ?? this.name,
      description: description ?? this.description,
     // branches: branches ?? this.branches,
      image: image ?? this.image,
      // category: category ?? this.category,
      // provider: provider ?? this.provider,
    );
  }
}



