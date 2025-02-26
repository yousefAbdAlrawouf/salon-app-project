import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:salon_app/features/Provider_App/auth/presentation/pages/edit_profile_page.dart';
import 'package:salon_app/features/Provider_App/auth/presentation/manger/authntication_cubit.dart';
import 'package:salon_app/features/Provider_App/auth/presentation/manger/authntication_state.dart';

class MyAccountPage extends StatefulWidget {
  const MyAccountPage({super.key});

  @override
  State<MyAccountPage> createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Profile".tr(),
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: BlocBuilder<AuthnticationCubit, AuthnticationState>(
        builder: (context,state) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 17.0, end: 23),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 19),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          child: Text(state.authData!.user.name[0].toUpperCase()),
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Text(
                              state.authData!.user.name,
                              style: TextStyle(color: Colors.black, fontSize: 23),
                            ),
                            Text(state.authData!.user.phone)
                          ],
                        ),
                        Spacer()
                      ],
                    ),
                    SizedBox(height: 12),
                    Text("Account",
                        style: TextStyle(
                            color: Color.fromRGBO(67, 21, 42, 1), fontSize: 22)),
                    SizedBox(height: 12),
                    ListTile(
                      onTap: () {
                         Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => BlocProvider.value(
                                              value: BlocProvider.of<
                                                  AuthnticationCubit>(context),
                                              child: EditProfile(),
                                            )));
                      },
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      title: Text(
                        "Edit Profile",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(Icons.arrow_right_alt, color: Colors.grey),
                      style: ListTileStyle.drawer,
                    )
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
