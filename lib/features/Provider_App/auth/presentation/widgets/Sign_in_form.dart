import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:salon_app/features/Provider_App/auth/presentation/widgets/Login_button.dart';
import 'package:salon_app/features/Provider_App/auth/presentation/widgets/TextFormField.dart';
import 'package:salon_app/features/Provider_App/auth/presentation/widgets/forget_password_text.dart';
import 'package:salon_app/features/Provider_App/auth/presentation/widgets/sign_up_options.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(36)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          Center(
            child: Text(
              "Welcome, User Your Phone To Sign On".tr(),
              style: const TextStyle(fontSize: 18, color: Color(0x80000000)),
            ),
          ),
          const SizedBox(height: 18),
          IntlPhoneField(
            disableLengthCheck: true,
            controller: phoneController,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(16),
              hintText: '5656 5656 665',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFCBCBCB)),
              ),
            ),
            initialCountryCode: 'SA',
          ),
          const SizedBox(height: 12),
          CustomTextFormField(
            isPassword: true,
            controller: passwordController,
            hintText: "Password",
            prefixIcon: SvgPicture.asset(
              "assets/icons/password.svg",
              width: 18,
              height: 18,
              fit: BoxFit.scaleDown,
            ),
            suffixIcon: const Icon(Icons.remove_red_eye_outlined),
          ),
          const SizedBox(height: 8),
          const ForgotPasswordText(), 
          LoginButton(phoneController, passwordController), 
          const SignUpOption(), 
        ],
      ),
    );
  }
}
