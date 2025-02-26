import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Widget signUpHeader() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 44),
      Text("Create new account.".tr(),
          style: TextStyle(
              color: Colors.black,
              fontSize: 32,
              fontFamily: "Meditative",
              fontWeight: FontWeight.bold)),
      Text("Enter the following info to create New Account".tr()),
    ],
  );
}