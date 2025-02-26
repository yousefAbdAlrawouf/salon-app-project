
import 'package:flutter/material.dart';

class ProductNeedItem extends StatelessWidget {
  const ProductNeedItem({
    super.key,
    // required this.product
  });
  // final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
  decoration: BoxDecoration(
    color: Colors.white, // Background color
    borderRadius: BorderRadius.circular(15),
    boxShadow: [
      BoxShadow(
        color: Color.fromRGBO(227,227,227,1),
        spreadRadius: 1, 
        blurRadius: 5, 
        offset: Offset(2, 2), 
      ),
    ],
  ),
      child: ListTile(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(15),
        ),
        leading: ClipRRect(
          child: Image.asset("assets/images/product.png"),
        ),
        title: Text(
          "Product Name",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w700, fontSize: 16),
        ),
        subtitle: RichText(
            text: TextSpan(children: [
          TextSpan(
              text: "200 \$",
              style: TextStyle(
                  color: Color.fromRGBO(245, 11, 95, 1),
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  decoration: TextDecoration.lineThrough)),
          TextSpan(
              text: "      175 \$",
              style: TextStyle(
                  color: Color.fromRGBO(56, 56, 56, 1),
                  fontWeight: FontWeight.w400,
                  fontSize: 14)),
        ])),
      ),
    );
  }
}
