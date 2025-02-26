import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:salon_app/core/routes/routes_path.dart';

class SignUpBottom extends StatelessWidget {
  const SignUpBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Text("Already Have Account ?  ".tr()),
      InkWell(
          onTap: () {
            context.go(RoutesPath.signIn);
          },
          child: Text("Sign In".tr(),
              style: TextStyle(
                  color: Color.fromRGBO(69, 21, 43, 1),
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold)))
    ]);
  }
}
