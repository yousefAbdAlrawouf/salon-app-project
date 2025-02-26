import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon_app/core/Dio/service_locator.dart';
import 'package:salon_app/core/widgets/GradientAppBar.dart';
import 'package:salon_app/core/widgets/GradientBackgroundScaffold.dart';
import 'package:salon_app/features/Provider_App/auth/data/abstract_auth_remote.dart';
import 'package:salon_app/features/Provider_App/auth/presentation/manger/authntication_cubit.dart';
import 'package:salon_app/features/Provider_App/auth/presentation/widgets/Logo_widget.dart';
import '../widgets/forget_password_form.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthnticationCubit(getInstance<AuthRemoteDataSource>()),
      child: GradientBackgroundScaffold(
        appBar: GradientAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: const [
              LogoWidget(),
              ForgetPasswordForm(),
            ],
          ),
        ),
      ),
    );
  }
}
