import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:salon_app/core/routes/routes_path.dart';
import 'package:salon_app/features/Provider_App/Home_provider/presentation/widgets/booking_top_bar.dart';

import 'package:salon_app/features/User_App/appointments/presentation/pages/booking_section.dart';

class BookingsContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Booking",
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
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          BookingTopBarState(),
          GestureDetector(onTap: (){context.go(RoutesPath.orderDetails);},child: BookingCard()),
          BookingCard(),
          BookingCard(),
        
        ]),
      ),
    );
  }
}
