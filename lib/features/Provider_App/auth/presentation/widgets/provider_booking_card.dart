import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salon_app/core/app_manger/app_manager_cubit.dart';
import 'package:salon_app/core/app_manger/app_manager_state.dart';
import 'package:salon_app/core/constants/app_colors.dart';
import 'package:salon_app/features/User_App/appointments/presentation/manger/appoitment_cubit.dart';
import 'package:salon_app/features/User_App/appointments/presentation/manger/appoitment_state.dart';

Card providerBookingCustomWidget(bool canEdit) {
  return Card(
    color: AppColors.bookingBackGroundColor,
    child: IntrinsicHeight(
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.stretch,
        children: [
          Container(
            width: 16, 
            decoration: BoxDecoration(
            color: AppColors.primarycolor,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(12),bottomLeft: Radius.circular(12)) 

            ),
          ),
          SizedBox(width: 8),

          Expanded(
            child: Padding(
              padding: EdgeInsets.all(6),
              child: BlocBuilder<BookingCubit, BookingState>(
                builder: (context, state) {
                  return BlocBuilder<AppManagerCubit, AppManagerState>(
                    builder: (context, mangerState) {
                      return Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start, // Align content properly
                        children: [
                          SizedBox(height: 5),
                          Row(
                            children: [
                              CircleAvatar(
                                child: mangerState.authResponseModel != null
                                    ? (mangerState.authResponseModel?.user
                                                .image !=
                                            null
                                        ? Image.network(mangerState
                                            .authResponseModel!.user.image)
                                        : Image.asset(
                                            "assets/images/sign_up_stack.png"))
                                    : Image.asset(
                                        "assets/images/sign_up_stack.png"),
                              ),
                              SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    mangerState.authResponseModel?.user.name ??
                                        "User Name",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    "1 hr 30 mins",
                                    style: TextStyle(
                                        color: Color.fromRGBO(129, 129, 129, 1),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                              Spacer(),
                              Text("\$12.3",
                                  style: TextStyle(
                                      color: Color.fromRGBO(166, 77, 121, 1),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Provider Name"),
                              Spacer(),
                              Card(
                                color: AppColors.greyColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.brightness_1,
                                        size: 8,
                                        color: Color.fromRGBO(166, 77, 121, 1),
                                      ),
                                      Text(
                                        " In Home",
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(166, 77, 121, 1),
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset("assets/icons/location.svg",
                                  colorFilter: ColorFilter.mode(
                                      Colors.black, BlendMode.srcIn)),
                              SizedBox(width: 8),
                              Text(
                                "Location Name - street 23",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    decoration: TextDecoration.underline),
                              )
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.date_range),
                              SizedBox(width: 4),
                              Text("From 30-7-2024"),
                              SizedBox(width: 12),
                              Icon(Icons.timer_sharp),
                              Text("From :3:30 Am"),
                            ],
                          ),
                          BlocBuilder<BookingCubit, BookingState>(
                            builder: (context, state) {
                              if (state.canEdit == false &&
                                  state.canceledListTile == false) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        context
                                            .read<BookingCubit>()
                                            .canEditListTile();
                                      },
                                      child: Card(
                                        color: AppColors.primarycolor,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "  Edit  ",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                      Card(
                                  color: AppColors.bookingBackGroundColor,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
