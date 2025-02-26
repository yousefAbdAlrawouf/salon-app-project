
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:salon_app/core/Dio/service_locator.dart';
import 'package:salon_app/core/app_manger/app_manager_cubit.dart';
import 'package:salon_app/core/constants/app_colors.dart';
import 'package:salon_app/core/routes/routes_path.dart';
import 'package:salon_app/core/widgets/GradientAppBar.dart';
import 'package:salon_app/core/widgets/GradientBackgroundScaffold.dart';
import 'package:salon_app/features/Provider_App/auth/data/abstract_auth_remote.dart';
import 'package:salon_app/features/Provider_App/auth/presentation/manger/authntication_cubit.dart';
import 'package:salon_app/features/Provider_App/auth/presentation/manger/authntication_state.dart';
import 'package:salon_app/features/Provider_App/auth/presentation/widgets/Sign_in_form.dart';
import 'package:salon_app/features/Provider_App/auth/presentation/widgets/sign_in_header.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AuthnticationCubit(getInstance<AuthRemoteDataSource>()),
      child: Builder(
        builder: (ctx) => GradientBackgroundScaffold(
          appBar: GradientAppBar(),
          body: BlocConsumer<AuthnticationCubit, AuthnticationState>(
            builder: (context, state) {
              return state.isLoading == false
                  ? SingleChildScrollView(
                      child: Column(
                        children: const [
                          SignInHeader(),
                          SignInForm(),
                        ],
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(
                      color: AppColors.primarycolor,
                    ));
            },
            listener: (BuildContext context, state) {
              if (state.haveAccess) {
                context.go(RoutesPath.homeUser,
                    extra: BlocProvider.of<AuthnticationCubit>(context));
                if (state.authData != null) {
                  context
                      .read<AppManagerCubit>()
                      .saveUserDataInAppState(state.authData!);
                }
              }
            },
          ),
        ),
      ),
    );
  }
}
