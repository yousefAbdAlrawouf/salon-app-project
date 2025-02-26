import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:salon_app/core/Dio/service_locator.dart';
import 'package:salon_app/core/routes/routes_path.dart';
import 'package:salon_app/features/Provider_App/auth/data/abstract_auth_remote.dart';
import 'package:salon_app/features/Provider_App/auth/presentation/manger/authntication_cubit.dart';
import 'package:salon_app/features/Provider_App/auth/presentation/manger/authntication_state.dart';
import 'package:salon_app/core/widgets/GradientAppBar.dart';
import 'package:salon_app/core/widgets/GradientBackgroundScaffold.dart';

class Changepassword extends StatelessWidget {
  final String? code;
  final String? phoneNumber;
  Changepassword({super.key, this.code, this.phoneNumber});

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AuthnticationCubit(getInstance<AuthRemoteDataSource>()),
      child: Builder(builder: (ctx) {
        return GradientBackgroundScaffold(
          appBar: GradientAppBar(
            title: "Change Password".tr(),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(36),
                    topRight: Radius.circular(36),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 24.0, right: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("New Password",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          Card(
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Color.fromRGBO(203, 203, 203, 1)),
                                borderRadius: BorderRadius.circular(16)),
                            child: TextFormField(
                              controller: passwordController,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                border: InputBorder.none,
                                hintText: '********'.tr(),
                                suffixIcon: Icon(Icons.remove_red_eye_outlined),
                                prefixIcon: Icon(Icons.key_outlined),
                                contentPadding: EdgeInsets.all(20),
                              ),
                              validator: (value) {
                                if ((value?.length ?? 0) < 8) {
                                  return 'at least 8 chars '.tr();
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Confirm New Password",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),

                          Card(
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Color.fromRGBO(203, 203, 203, 1)),
                                borderRadius: BorderRadius.circular(16)),
                            child: TextFormField(
                              controller: passwordConfirmController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor: Colors.white,
                                filled: true,
                                hintText: '*********'.tr(),
                                contentPadding: EdgeInsets.all(20),
                                prefixIcon: Icon(Icons.key_outlined),
                              ),
                              validator: (value) {
                                if (value != passwordController.text) {
                                  return 'passwords doesnt match'.tr();
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),
                      BlocConsumer<AuthnticationCubit, AuthnticationState>(
                        listener: (BuildContext context, state) {
                          if (state.haveAccess) {
                            context.go(RoutesPath.signIn);
                          }
                        },
                        builder: (context, state) {
                          return Column(
                            children: [
                              ClickableGradientButton(phoneNumber: phoneNumber, code: code, passwordController: passwordController, passwordConfirmController: passwordConfirmController),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

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
