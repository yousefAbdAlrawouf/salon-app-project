import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:salon_app/core/routes/routes_path.dart';
import 'package:salon_app/core/widgets/GradientBackgroundScaffold.dart';

class Splashpage extends StatelessWidget {
  const Splashpage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: GradientBackgroundScaffold(
          body: Center(
        child: Text(
          "Yousef Abd".tr(),
          style: TextStyle(color: Colors.white, fontSize: 45),
        ),
      )),
      onTap: () {
       context.go(RoutesPath.welcome);
      },
    );
  }
}
