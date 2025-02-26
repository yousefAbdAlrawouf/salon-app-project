import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:salon_app/features/Provider_App/auth/models/editProfileParams.dart';
import 'package:salon_app/features/Provider_App/auth/presentation/manger/authntication_cubit.dart';
import 'package:salon_app/features/Provider_App/auth/presentation/manger/authntication_state.dart';
import 'package:salon_app/features/Provider_App/auth/presentation/widgets/select_one_from_options_widget.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Profile".tr(),
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: BlocBuilder<AuthnticationCubit, AuthnticationState>(
          builder: (context, state) {
        String gender = state.authData?.user.gender ?? ""; 
        TextEditingController nameController =
            TextEditingController(text: state.authData!.user.name);
        TextEditingController emailController =
            TextEditingController(text: state.authData!.user.email);
        TextEditingController phoneController =
            TextEditingController(text: state.authData!.user.phone);
        return SafeArea(
          child: Padding(
            padding: const EdgeInsetsDirectional.only(start: 17.0, end: 23),
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: 19),
                    CircleAvatar(
                      radius: 30,
                      child: Text(state.authData!.user.name[0].toUpperCase()),
                    ),
                    Text(
                      state.authData!.user.name,
                      style: TextStyle(color: Colors.black, fontSize: 23),
                    ),
                    Text(state.authData!.user.phone),
                    SizedBox(height: 12),
                    TextFormField(
                      controller: nameController,
                      decoration:
                          InputDecoration(hintText: nameController.text),
                    ),
                    SizedBox(height: 12),
                    TextFormField(
                      controller: emailController,
                      decoration:
                          InputDecoration(hintText: emailController.text),
                    ),
                    SizedBox(height: 12),
                    TextFormField(
                      controller: phoneController,
                      decoration:
                          InputDecoration(hintText: phoneController.text),
                    ),
                    SizedBox(height: 12),
                    SelectOneFromOptionsWidget(
                      name: "",
                        onOptionSelected: (optionSelected) {
                          gender = optionSelected;
                          log(gender);
                        },
                        items: ['female'.tr(), 'male'.tr()]),
                    SizedBox(height: 16),
                    ElevatedButton(
                        onPressed: () {
                          final params = Editprofileparams(
                              nameController.text,
                              emailController.text,
                              phoneController.text,
                              gender);

                          context
                              .read<AuthnticationCubit>()
                              .editProfile(params);
                        },
                        child: Text("Save Edit"))
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
