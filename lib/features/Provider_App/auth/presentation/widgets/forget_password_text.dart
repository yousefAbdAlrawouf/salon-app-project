import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:salon_app/core/routes/routes_path.dart';

class ForgotPasswordText extends StatelessWidget {
  const ForgotPasswordText({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.go(RoutesPath.forgetPassword),
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          "Forget Password?".tr(),
          style: const TextStyle(
            decoration: TextDecoration.underline,
            color: Color(0xFF909090),
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
