import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:salon_app/core/routes/routes_path.dart';
import 'package:salon_app/core/widgets/GradientClickableButton.dart';
import 'package:salon_app/features/Provider_App/auth/presentation/manger/authntication_cubit.dart';
import 'package:salon_app/features/Provider_App/auth/presentation/manger/authntication_state.dart';

class SignUpOption extends StatelessWidget {
  const SignUpOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<AuthnticationCubit, AuthnticationState>(
            builder: (context, state) => Center(
              child: state.errorWithLogin ? Column(
                children: [
                  Card(
                    color: Color.fromRGBO(144, 34, 84, 0.25),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text( "Confirmation failed. Please check the number" ,style: TextStyle(color: Color.fromRGBO(62, 12, 12, 1)),),
                    ) ,
                  ),
                  SizedBox(height: 18),
                ],
              ) : SizedBox()
            )
            ),
        Text(
          "Don't Have An Account?".tr(),
          textAlign: TextAlign.justify,
          style: const TextStyle(
            color: Color(0xFF515151),
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
        GradientButton(
          firstColor: const Color(0xFFF1F1F1),
          secondColor: const Color(0xFFF1F1F1),
          textColor: const Color(0xFF26263C),
          text: "Sign Up".tr(),
          onPressed: () => context.go(RoutesPath.signUp),
        ),
        Center(
          child: TextButton(
            onPressed: () {},
            child: const Text(
              "Join as a Guest",
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF26263C),
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        Center(child: TextButton(onPressed: (){context.go(RoutesPath.faildAndSuccess);}, child: Text("Failed and Success")),)
      ],
    );
  }
}
