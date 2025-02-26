import 'package:flutter/material.dart';
import 'package:salon_app/core/constants/app_colors.dart';
import 'package:salon_app/features/Provider_App/Home_provider/presentation/widgets/Product_metrices_card.dart';

class ProductMetricesDashboardSection extends StatelessWidget {
  const ProductMetricesDashboardSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: MediaQuery.sizeOf(context).width / 78,
          left: MediaQuery.sizeOf(context).width / 78),
      child: Column(
        children: [
          Center(
              child: Text(
            "Product Metrics Dashboard",
            style: TextStyle(
                color: AppColors.primarycolor,
                fontSize: 23,
                fontWeight: FontWeight.w400),
          )),
          ProductMetricesCard(count: "938", text: "Completed service"),
          SizedBox(height: MediaQuery.sizeOf(context).height / 95),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: ProductMetricesCard(count: "83", text: "Services requests")),
              Expanded(
                  child: ProductMetricesCard(count: "4", text: "Service reservations"))
            ],
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height / 80),
          Divider(thickness: 2),
          SizedBox(height: MediaQuery.sizeOf(context).height / 80),
          Center(
              child: Text(
            "Product Metrics Dashboard",
            style: TextStyle(
                color: AppColors.primarycolor,
                fontSize: 23,
                fontWeight: FontWeight.w400),
          )),
          ProductMetricesCard(count: "900", text: "A product you sold"),
          SizedBox(height: MediaQuery.sizeOf(context).height / 95),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: ProductMetricesCard(count: "50", text: "Product requests")),
              Expanded(
                  child: ProductMetricesCard(count: "8", text: "Waiting for shipping"))
            ],
          )
        ],
      ),
    );
  }
}
