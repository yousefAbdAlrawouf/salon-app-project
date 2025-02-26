import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon_app/core/constants/app_colors.dart';
import 'package:salon_app/features/User_App/appointments/presentation/manger/appoitment_cubit.dart';
import 'package:salon_app/features/User_App/appointments/presentation/manger/appoitment_state.dart';

Card bookingCustomWidget(bool canEdit) {
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
              padding: EdgeInsets.all(6),
              child: BlocBuilder<BookingCubit, BookingState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CircleAvatar(child: Icon(Icons.image, size: 40)),
                          SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("User Name",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                              Row(
                                children: [
                                  Icon(Icons.location_on),
                                  SizedBox(width: 4),
                                  Text("Location Name - street 23",
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          fontWeight: FontWeight.bold))
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Row(children: [
                                Text(
                                  "\$12.3",
                                  style: TextStyle(
                                      color: Color.fromRGBO(166, 77, 121, 1),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                canEdit ? Icon(Icons.edit) : SizedBox()
                              ]),
                              state.canEdit
                                  ? Card(
                                      color: AppColors.greyColor,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("OnGoing Late",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    166, 77, 121, 1),
                                                fontWeight: FontWeight.bold)),
                                      ))
                                  : SizedBox()
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.date_range),
                          SizedBox(width: 4),
                          Text("From 30-7-2024"),
                          SizedBox(width: 12),
                          Icon(Icons.timer_sharp),
                          Text("From :3:30 Am"),
                          TextButton(
                              onPressed: () {},
                              child: Card(
                                color: AppColors.greyColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.brightness_1,
                                        size: 8,
                                        color: Color.fromRGBO(166, 77, 121, 1),
                                      ),
                                      Text(
                                        "  In Home",
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(166, 77, 121, 1),
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                              ))
                        ],
                      ),
                      BlocBuilder<BookingCubit, BookingState>(
                        builder: (context, state) {
                          if (state.canEdit == false &&
                              state.canceledListTile == false) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      context
                                          .read<BookingCubit>()
                                          .canEditListTile();
                                    },
                                    child: Card(
                                        child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text("Edit")))),
                                TextButton(
                                  onPressed: () {},
                                  child: Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Cancel"),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          } else if (state.canEdit == true &&
                              state.canceledListTile == false) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    context
                                        .read<BookingCubit>()
                                        .canceledListTile();
                                  },
                                  child: Text("Client Not Coming"),
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: Text("On The Way")),
                                TextButton(
                                    onPressed: () {}, child: Text("Done")),
                              ],
                            );
                          } else {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Reason Of Canceling",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("Change My Mind"),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                        onPressed: () {},
                                        child: Text("Delete")),
                                  ],
                                ),
                              ],
                            );
                          }
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
