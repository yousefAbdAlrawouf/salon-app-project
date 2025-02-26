import 'package:flutter/material.dart';
import 'package:salon_app/core/app_manger/app_manager_cubit.dart';
import 'package:salon_app/core/app_manger/app_manager_state.dart';
import 'package:salon_app/core/routes/routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SalonApp extends StatefulWidget {
  const SalonApp({super.key});

  @override
  State<SalonApp> createState() => _SalonAppState();
}

class _SalonAppState extends State<SalonApp> {
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context)  =>  AppManagerCubit()..initApp(),
      child: Builder(builder: (context) {
        return BlocBuilder<AppManagerCubit, AppManagerState>(
            builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            routerConfig: AppRoutes.router,
            theme: ThemeData(
              inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                filled: true,
                fillColor: Colors.white,
                hintStyle: TextStyle(color: Colors.grey),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 19),
              ),
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
          );
        });
      }),
    );
  }
}
