import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon_app/core/Dio/service_locator.dart';
import 'package:salon_app/core/app_manger/app_manager_cubit.dart';
import 'package:salon_app/core/app_manger/app_manager_state.dart';
import 'package:salon_app/core/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  initDependencyInjection();

  runApp(EasyLocalization(
      supportedLocales: [Locale('ar'), Locale('en')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      child: SalonApp()));
}

class SalonApp extends StatefulWidget {
  const SalonApp({super.key});

  @override
  State<SalonApp> createState() => _SalonAppState();
}

class _SalonAppState extends State<SalonApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppManagerCubit()..initApp(),
      child: Builder(builder: (context) {
        return BlocBuilder<AppManagerCubit, AppManagerState>(
            builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            routerConfig: AppRoutes.router,
          );
        });
      }),
    );
  }
}
