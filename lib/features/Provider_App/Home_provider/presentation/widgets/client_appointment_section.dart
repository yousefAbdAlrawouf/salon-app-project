import 'package:flutter/material.dart';
import 'package:salon_app/core/constants/app_colors.dart';
import 'package:salon_app/features/User_App/appointments/presentation/pages/booking_section.dart';

class ClientAppointmentSection extends StatelessWidget {
  const ClientAppointmentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Client Appointment",
              style: TextStyle(
                  color: AppColors.primarycolor,
                  fontWeight: FontWeight.w400,
                  fontSize: 23,
                  fontFamily: "Meditative"),
            ),
            Row(
              children: [
                Text("See All"),
                Icon(Icons.keyboard_arrow_right_outlined)
              ],
            )
          ],
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height / 80),
        BookingCard(
          isProvider: true,
        )
      ],
    );
  }
}
