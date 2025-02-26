import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:salon_app/features/Provider_App/auth/presentation/widgets/next_button.dart';
import 'package:salon_app/features/Provider_App/auth/presentation/widgets/phone_number_input.dart';


class ForgetPasswordForm extends StatefulWidget {
  const ForgetPasswordForm({super.key});

  @override
  State<ForgetPasswordForm> createState() => _ForgetPasswordFormState();
}

class _ForgetPasswordFormState extends State<ForgetPasswordForm> {
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(36),
          topRight: Radius.circular(36),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 43),
            Text(
              "Phone Number".tr(),
              style: const TextStyle(
                fontSize: 45,
                color: Color.fromRGBO(56, 56, 56, 1),
                fontFamily: "Meditative",
              ),
            ),
            Text(
              "Enter your number to send OTP Number".tr(),
              style: const TextStyle(
                color: Color.fromRGBO(81, 81, 81, 1),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 36),
            PhoneNumberInput(controller: phoneController), // Extracted widget
            const SizedBox(height: 120),
            NextButton(phoneController: phoneController), // Extracted widget
          ],
        ),
      ),
    );
  }
}
