import 'package:salon_app/features/products_and_services/models/product_model.dart';
import 'package:salon_app/features/products_and_services/models/service_model.dart';

class ProductsAndServicesState {
  bool? isLoading;
  final String? error;
  final List<ProductModel> products;
  final List<ServiceModel> services;
  bool canEdit = true; // to remove


  

  ProductsAndServicesState(
      {required this.services,this.error, required this.products, this.isLoading = false});

  ProductsAndServicesState copyWith({
    List<ProductModel>? products,
    bool? isLoading,
    String? error,
    List<ServiceModel>? services
  }) {
    return ProductsAndServicesState(
      products: products ?? this.products,
      error: error,
      isLoading: isLoading ?? false,
      services: services ?? this.services
    );
  }
}
