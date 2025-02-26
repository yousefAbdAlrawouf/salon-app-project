import 'package:flutter/material.dart';
import 'package:salon_app/features/Provider_App/Home_provider/presentation/widgets/booking_top_bar.dart';
import 'package:salon_app/features/Provider_App/Home_provider/presentation/widgets/order_card.dart';

class OrdersContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Request",
          style: TextStyle(
              color: Colors.black,
              fontSize: 28,
              fontWeight: FontWeight.w400,
              fontFamily: "Meditative"),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BookingTopBarState(
                secoundTapTitle: "Complete", thirdTapTitle: "Canceled"),
            Padding(
              padding: const EdgeInsets.only(right: 12.0, left: 12),
              child: Column(
                children: [
                  SizedBox(height: 12),

                  OrderCard(),
                  SizedBox(height: 12),
                  OrderCard(),
                  SizedBox(height: 12),

                  OrderCard(),
                  SizedBox(height: 12),

                  OrderCard(),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
