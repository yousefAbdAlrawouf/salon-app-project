import 'package:flutter/widgets.dart';
import 'package:salon_app/features/products_and_services/presentation/manager/Products_And_Services_State.dart';
import 'package:salon_app/features/products_and_services/presentation/widgets/Service_item.dart';

Widget servicesList(ProductsAndServicesState state) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, 
          childAspectRatio: 0.69, 
          crossAxisSpacing: 12.0, 
          mainAxisSpacing: 16.0, 
        ),
        itemCount: state.products.length,
        itemBuilder: (context, index) {
          final service = state.services[index];
          return ServiceItem(
            serviceDetails: service,
          );
        },
      ),
    );
  
}