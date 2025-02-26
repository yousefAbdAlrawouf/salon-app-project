import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:salon_app/features/products_and_services/models/Products_without_details_model.dart';

class ProductItem extends StatelessWidget {
  final ProductsWithoutDetailsModel productDetails;
  const ProductItem({super.key, required this.productDetails});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.18,
            width: double.infinity,
            child: Image.network(
              productDetails.productImageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'assets/images/handleimageerror.png',
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          Text(
            productDetails.proudctName.tr(),
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          //Text("${productDetails.price}\$ ${productDetails.discountPrice}\$"),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "${productDetails.price} \$",
                  style: TextStyle(
                    color: Colors.pink,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                TextSpan(
                  text: "   ${productDetails.discountPrice}\$",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
