import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:salon_app/core/routes/routes_path.dart';
import 'package:salon_app/core/widgets/GradientClickableButton.dart';
import 'package:salon_app/features/Provider_App/auth/presentation/manger/authntication_cubit.dart';
import 'package:salon_app/features/Provider_App/auth/presentation/manger/authntication_state.dart';

class NextButton extends StatelessWidget {
  final TextEditingController phoneController;

  const NextButton({super.key, required this.phoneController});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthnticationCubit, AuthnticationState>(
      listener: (BuildContext context, state) {
        if (state.haveAccess) {
          context.go(RoutesPath.otpNumber, extra: {
            'phoneNumber': phoneController.text,
          });
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () {},
          child: GradientButton(
            text: "Next",
            onPressed: () {
              context.go(RoutesPath.otpNumber, extra: {
                "phoneNumber": phoneController.text
              });
              context.read<AuthnticationCubit>().forgetPassword(phoneController.text);
            },
          ),
        );
      },
    );
  }
}
