
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ServiceRowItem extends StatelessWidget {
   ServiceRowItem({super.key,required this.serviceName,required this.price,this.serviceStyle,this.priceStyle});
  final String serviceName;
  final String price;
   TextStyle? serviceStyle= TextStyle(          fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(67, 67, 67, 1),);
    TextStyle? priceStyle = TextStyle( fontSize: 14,
            fontWeight: FontWeight.w200,
            fontStyle: FontStyle.italic,
            color: Color.fromRGBO(67, 67, 67, 1),);


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            serviceName,
            style: serviceStyle
          ),
        ),
        Text(
          "\$$price",
          style: priceStyle 
        ),
      ],
    );
  }
}
