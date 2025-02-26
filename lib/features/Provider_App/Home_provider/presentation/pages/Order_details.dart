import 'package:flutter/material.dart';
import 'package:salon_app/core/constants/app_colors.dart';
import 'package:salon_app/features/Provider_App/Home_provider/presentation/widgets/order_Details_topBar.dart';
import 'package:salon_app/features/Provider_App/Home_provider/presentation/widgets/order_location_section.dart';
import 'package:salon_app/features/Provider_App/Home_provider/presentation/widgets/order_profile_section.dart';
import 'package:salon_app/features/Provider_App/Home_provider/presentation/widgets/product_need_item.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.greyColor,
          title: Text("Appointment Details",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Meditative"))),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OrderDetailstopBar(),
            SizedBox(height: 20),
            OrderProfileDetails(),
            SizedBox(height: 12),
            OrderLocationSection(),
            SizedBox(height: 12),
            SizedBox(
              child: Image.asset("assets/images/googleMap.png"),
            ),
            SizedBox(height: 20),
            Text(
              "The products he needs",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: Color.fromRGBO(112, 112, 112, 1)),
            ),
            SizedBox(height: 20),
            ProductNeedItem(),
            SizedBox(height: 8),
            ProductNeedItem(),
            SizedBox(height: 8),

            ProductNeedItem()


          ],
        ),
      ))),
    );
  }
}
