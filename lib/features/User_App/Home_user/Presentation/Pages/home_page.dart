import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:salon_app/core/app_manger/app_manager_cubit.dart';
import 'package:salon_app/core/routes/routes_path.dart';

import 'package:salon_app/features/User_App/Home_user/Presentation/Widget/OffersSection.dart';
import 'package:salon_app/features/User_App/Home_user/Presentation/Widget/ServicesAndProductExplore.dart';
import 'package:salon_app/features/User_App/Home_user/Presentation/Widget/TopBarSection.dart';
import 'package:easy_localization/easy_localization.dart';



class HomePageProvider extends StatefulWidget {
  const HomePageProvider({super.key});

  @override
  State<HomePageProvider> createState() => _HomePageProviderState();
}

class _HomePageProviderState extends State<HomePageProvider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home".tr(),
          style: TextStyle(color: Colors.black),
        ),
      ),
      bottomNavigationBar: TextButton(onPressed: (){
      context.read<AppManagerCubit>().logOut();
      context.go(RoutesPath.splash);
      }, child: Text("Log Out")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.only(start: 17.0, end: 23),
          child: SingleChildScrollView(
            child: Column(
              children: [
        
                SizedBox(height: 19),
                TopBarSection(),
                SizedBox(height: 18),
                OffersSection(),
                SizedBox(height: 18),
                ServicesAndProductSection(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          context.setLocale(Locale('en'));
                        },
                        child: Text('English'.tr())),
                    ElevatedButton(
                        onPressed: () {
                          context.setLocale(Locale('ar'));
                        },
                        child: Text('Arabic').tr()),
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      context.go(RoutesPath.signUp);
                    },
                    child: Text('Go Sign Up').tr()),

                      ElevatedButton(
                    onPressed: () {
                      context.go(RoutesPath.showproductsandservices);
                    },
                    child: Text('Show Products').tr()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
