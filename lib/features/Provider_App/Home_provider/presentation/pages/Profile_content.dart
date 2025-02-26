

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon_app/core/app_manger/app_manager_cubit.dart';
import 'package:salon_app/core/app_manger/app_manager_state.dart';

class ProfileContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Profile",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.edit, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: BlocBuilder<AppManagerCubit,AppManagerState>(
        builder: (context,state) {
          return Center(
            child: GestureDetector(child: Text("LogOut"),onTap: (){
              context.read<AppManagerCubit>().logOut();
              
            },),
          );
        }
      ),
    );
  }
}
