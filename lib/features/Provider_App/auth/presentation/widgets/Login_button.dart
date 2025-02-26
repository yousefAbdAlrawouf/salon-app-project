import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon_app/core/widgets/GradientClickableButton.dart';
import 'package:salon_app/features/Provider_App/auth/models/login_model.dart';
import 'package:salon_app/features/Provider_App/auth/presentation/manger/authntication_cubit.dart';
import 'package:salon_app/features/Provider_App/auth/presentation/manger/authntication_state.dart';

class LoginButton extends StatelessWidget {
  final TextEditingController phoneController;
  final TextEditingController passwordController;

  const LoginButton(this.phoneController, this.passwordController, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthnticationCubit, AuthnticationState>(
      builder: (context, state) {
        return GradientButton(
          text: 'Confirm'.tr(),
          onPressed: () {
            if (phoneController.text.isEmpty ||
                passwordController.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Please fill in all fields".tr())),
              );
            } else {
              context.read<AuthnticationCubit>().logIn(
                    LoginUserParams(
                      phoneNumber: phoneController.text,
                      password: passwordController.text,
                    ),
                  );
            }
          },
        );
      },
    );
  }
}
