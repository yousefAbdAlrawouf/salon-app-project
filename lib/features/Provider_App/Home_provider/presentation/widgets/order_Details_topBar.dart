import 'package:flutter/material.dart';

class OrderDetailstopBar extends StatelessWidget {
  const OrderDetailstopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
                  "Order ID #46501",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 28),
                ),
      
                Text(
                  "Nov 16, 2024",
                  style: TextStyle(
                      color: Color.fromRGBO(108, 108, 108, 1),
                      fontWeight: FontWeight.w800,
                      fontSize: 19,
                      fontStyle: FontStyle.italic),
                ),
      
      
        ],),
    );
  }
}