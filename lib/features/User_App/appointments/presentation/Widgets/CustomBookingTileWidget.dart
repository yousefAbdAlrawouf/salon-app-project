import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
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
                        children: [
                          ClipOval(
                              child:
                                  Image.asset("assets/images/profilePic.png")),
                          SizedBox(width: 22),
                          Column(
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
                                          fontWeight: FontWeight.w700))
                                ],
                              ),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Row(children: [
                                Text(
                                  "\$12.3",
                                  style: TextStyle(
                                      color: AppColors.primarycolor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                state.canEdit
                                    ? Icon(
                                        Icons.edit,
                                        color: Colors.black,
                                      )
                                    : SizedBox()
                              ]),
                              state.canEdit
                                  ? Card(
                                      color: AppColors.greyColor,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("Ongoing Late",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    166, 77, 121, 1),
                                                fontWeight: FontWeight.w700)),
                                      ))
                                  : SizedBox()
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/cellender.svg",
                            width: 16,
                            height: 16,
                          ),
                          SizedBox(width: 4),
                          Text("From 30-7-2024",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 12)),
                          SizedBox(width: 12),
                          SvgPicture.asset(
                            "assets/icons/timer.svg",
                            width: 16,
                            height: 16,
                          ),
                          Text(
                            "From :08:30 Am",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 12),
                          ),
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
                                        color: AppColors.primarycolor,
                                      ),
                                      Text(
                                        "  In Home",
                                        style: TextStyle(
                                            color: AppColors.primarycolor,
                                            fontWeight: FontWeight.w700),
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
                                        color: AppColors.bookingBackGroundColor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            side: BorderSide(
                                                color: Color.fromRGBO(
                                                    227, 227, 227, 1))),
                                        child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 4.0,
                                                bottom: 4,
                                                right: 8,
                                                left: 8),
                                            child: Text("Edit",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    color: Color.fromRGBO(
                                                        102, 102, 102, 1)))))),
                                Card(
                                  color: AppColors.bookingBackGroundColor,
                                  // shape: Border.all(color: Color.fromRGBO(227, 227, 227, 1),style: BorderStyle.solid),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      side: BorderSide(
                                          color: Color.fromRGBO(
                                              227, 227, 227, 1))),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 4.0, bottom: 4, right: 8, left: 8),
                                    child: Text("Cancel",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: Color.fromRGBO(
                                                102, 102, 102, 1))),
                                  ),
                                ),
                              ],
                            );
                          } else if (state.canEdit == true &&
                              state.canceledListTile == false) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Card(
                                  color: AppColors.bookingBackGroundColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      side: BorderSide(
                                          color: Color.fromRGBO(
                                              227, 227, 227, 1))),
                                  child: GestureDetector(
                                    onTap: () {
                                      context
                                          .read<BookingCubit>()
                                          .canceledListTile();
                                    },
                                    child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 4.0,
                                            bottom: 4,
                                            right: 12,
                                            left: 12),
                                        child: Text(
                                          "Client Not Coming",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              color: Color.fromRGBO(
                                                  102, 102, 102, 1)),
                                        )),
                                  ),
                                ),
                                Card(
                                  color: AppColors.bookingBackGroundColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      side: BorderSide(
                                          color: Color.fromRGBO(
                                              227, 227, 227, 1))),
                                  child: GestureDetector(
                                      onTap: () {},
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 4.0,
                                            bottom: 4,
                                            right: 12,
                                            left: 12),
                                        child: Text("On The Way",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                color: Color.fromRGBO(
                                                    102, 102, 102, 1))),
                                      )),
                                ),
                                Card(
                                  color: AppColors.bookingBackGroundColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      side: BorderSide(
                                          color: Color.fromRGBO(
                                              227, 227, 227, 1))),
                                  child: GestureDetector(
                                      onTap: () {},
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 4.0,
                                            bottom: 4,
                                            right: 12,
                                            left: 12),
                                        child: Text("Done",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                color: Color.fromRGBO(
                                                    102, 102, 102, 1))),
                                      )),
                                ),
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
                                    Card(
                                        color: AppColors.bookingBackGroundColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      side: BorderSide(
                                          color: Color.fromRGBO(
                                              227, 227, 227, 1))),
                                      child: GestureDetector(
                                          onTap: () {},
                                          child: Padding(
                                            padding: const EdgeInsets.only(top: 4.0,bottom: 4,right: 8,left: 8),
                                            child: Text("Delete", style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  color: Color.fromRGBO(
                                                      102, 102, 102, 1))),
                                          )),
                                    ),
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
