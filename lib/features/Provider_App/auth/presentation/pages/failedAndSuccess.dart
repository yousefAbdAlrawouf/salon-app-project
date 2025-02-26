import 'package:flutter/material.dart';
import 'package:salon_app/core/constants/app_colors.dart';
import 'package:salon_app/features/Provider_App/auth/presentation/widgets/faild_And_Success_widget.dart';
import 'package:salon_app/features/Provider_App/auth/presentation/widgets/subscribe_methods.dart';

class FaildAndSuccess extends StatelessWidget {
  const FaildAndSuccess({super.key});
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Text("Deyram",
                        style: TextStyle(
                            color: AppColors.subscripeColor,
                            fontSize: 45,
                            fontWeight: FontWeight.w400))),
                SizedBox(height: 17),
                Text("Subscription features",
                    style: TextStyle(
                        color: AppColors.subscripeColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w400)),
                SizedBox(height: 17),
                Text("To Complete the subscription , pleas pay",
                    style: TextStyle(
                        color: Color.fromRGBO(81, 81, 81, 1),
                        fontSize: 18,
                        fontWeight: FontWeight.w400)),
                SizedBox(height: 34),
                Card(
                  color: AppColors.primarycolor,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 16),
                        Text("Annual subscription",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w600)),
                        SizedBox(height: 16),
                        Text(
                            "Lorem Ipsum Dolor Sit Amet, Consectetur Adipiscing Elit, Sed Do Eiusmod",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w400)),
                        SizedBox(height: 16),
                        Text(
                          "QAR 700",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          WidgetStatePropertyAll(Colors.white)),
                                  onPressed: () {},
                                  child: Text("subscription",
                                      style: TextStyle(
                                          color: AppColors.subscripeColor)))
                            ]),
                        SizedBox(height: 10)
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 25),
                FaildAndSuccessWidget(
                    assetIcon: "wallet", color: AppColors.subscripeColor),
                SizedBox(height: 30),
                FaildAndSuccessWidget(
                    assetIcon: "people", color: AppColors.darkGrey),
                SizedBox(height: 30),
                FaildAndSuccessWidget(
                    assetIcon: "location", color: AppColors.subscripeColor),
                SizedBox(height: 30),
                FaildAndSuccessWidget(
                    assetIcon: "music", color: AppColors.darkGrey),
                SizedBox(height: 30),
                FaildAndSuccessWidget(
                    assetIcon: "wallet", color: AppColors.subscripeColor),
                SizedBox(height: 30),
                FaildAndSuccessWidget(
                    assetIcon: "people", color: AppColors.darkGrey),
                SizedBox(height: 30),
              SubscribeMethods()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
