import 'package:flutter/material.dart';
import 'package:salon_app/core/constants/app_colors.dart';

Row completeOrder(String leftButtonText, String rightButtonText) {
  return Row(
    children: [
      Expanded(
        child: Card(
          color: AppColors.primarycolor,
          child: Center(
              child: Padding(
            padding: const EdgeInsets.only(top: 12.0, bottom: 12),
            child: Text(
              leftButtonText,
              style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w400),
            ),
          )),
        ),
      ),
      Expanded(
        child: Card(
          color: Colors.white,
          child: Center(
              child: Padding(
            padding: const EdgeInsets.only(top: 12.0, bottom: 12),
            child: Text(rightButtonText,style: TextStyle(color: Color.fromRGBO(87, 89, 126, 1),fontWeight: FontWeight.w400,fontSize: 16)),
          )),
        ),
      )
    ],
  );
}