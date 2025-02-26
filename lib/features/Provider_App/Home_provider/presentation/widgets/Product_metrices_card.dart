import 'package:flutter/material.dart';
import 'package:salon_app/core/constants/app_colors.dart';

class ProductMetricesCard extends StatelessWidget {
  const ProductMetricesCard({super.key,required this.count,required this.text});
  final String count;
  final String text;
  @override
  Widget build(BuildContext context) {
    return  Card(
      color: Colors.white,
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.sizeOf(context).height / 40,
                    bottom: MediaQuery.sizeOf(context).height / 40),
                child: Column(
                  children: [
                    Text(count,
                        style: TextStyle(
                            color: AppColors.primarycolor,
                            fontSize: 23,
                            fontWeight: FontWeight.bold)),
                    Text(
                      text,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}