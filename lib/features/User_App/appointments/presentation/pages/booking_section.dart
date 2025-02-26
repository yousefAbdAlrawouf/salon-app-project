import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon_app/features/Provider_App/auth/presentation/widgets/provider_booking_card.dart';
import 'package:salon_app/features/User_App/appointments/presentation/manger/appoitment_cubit.dart';
import 'package:salon_app/features/User_App/appointments/presentation/manger/appoitment_state.dart';
import 'package:salon_app/features/User_App/appointments/presentation/Widgets/CustomBookingTileWidget.dart';

// ignore: must_be_immutable
class BookingCard extends StatelessWidget {
   BookingCard({super.key,this.isProvider});
  bool? isProvider =false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookingCubit(),
      child: Builder(builder: (ctx) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              BlocBuilder<BookingCubit, BookingState>(
                  builder: (context, state) {
                return isProvider==true ? providerBookingCustomWidget(true) : bookingCustomWidget(false);
              }),
            ],
          ),
        );
      }),
    );
  }
}
