import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneNumberInput extends StatelessWidget {
  final TextEditingController controller;
  
  const PhoneNumberInput({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      disableLengthCheck: true,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(16),
        hintText: '5656 5656 665',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Color.fromRGBO(203, 203, 203, 1),
          ),
        ),
      ),
      initialCountryCode: 'SA',
    );
  }
}
