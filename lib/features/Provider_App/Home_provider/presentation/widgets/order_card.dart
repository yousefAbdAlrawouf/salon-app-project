import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salon_app/core/constants/app_colors.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.bookingBackGroundColor,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 16,
              decoration: BoxDecoration(
                  color: AppColors.primarycolor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12))),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipOval(
                            child: Image.asset("assets/images/profilePic.png",
                                fit: BoxFit.cover),
                          ),
                          SizedBox(width: 10), // Space between image & text
        
                          // User Details
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("User Name",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20)),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                        "assets/icons/booking_location.svg",
                                        colorFilter: ColorFilter.mode(
                                            Colors.black, BlendMode.srcIn)),
                                    SizedBox(width: 4),
                                    Text("Location Name - street 23",
                                        style: TextStyle(
                                            decoration: TextDecoration.underline,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700)),
                                  ],
                                ),
                              ],
                            ),
                          ),
        
                          // Price
                          Text(
                            "\$12.3",
                            style: TextStyle(
                                color: AppColors.primarycolor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
        
                      SizedBox(height: 10), // Space between rows
        
                      // Action Buttons Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          _buildStatusCard(
                              "Completed", AppColors.primarycolor, Colors.white),
                          SizedBox(width: 8), // Space between buttons
                          _buildStatusCard(
                              "Rejected",
                              AppColors.bookingBackGroundColor,
                              Color.fromRGBO(102, 102, 102, 1)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Status Card Widget
  Widget _buildStatusCard(String text, Color bgColor, Color textColor) {
    return Card(
      color: bgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Color.fromRGBO(227, 227, 227, 1)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(text,
            style: TextStyle(fontWeight: FontWeight.w400, color: textColor)),
      ),
    );
  }
}
