
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon_app/features/Provider_App/auth/presentation/manger/authntication_cubit.dart';

class ClickableGradientButton extends StatelessWidget {
  const ClickableGradientButton({
    super.key,
    required this.phoneNumber,
    required this.code,
    required this.passwordController,
    required this.passwordConfirmController,
  });

  final String? phoneNumber;
  final String? code;
  final TextEditingController passwordController;
  final TextEditingController passwordConfirmController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          context
              .read<AuthnticationCubit>()
              .resetPassword(
                  phoneNumber ?? "",
                  code ?? "",
                  passwordController.text,
                  passwordConfirmController.text);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: EdgeInsets.zero,
        ),
        child: Ink(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(166, 77, 121, 1),
                    Color.fromRGBO(225, 149, 171, 1),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius:
                    BorderRadius.circular(8.0)),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(
                  vertical: 12.0),
              child: Text('Create New Password'.tr(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16)),
            )));
  }
}
