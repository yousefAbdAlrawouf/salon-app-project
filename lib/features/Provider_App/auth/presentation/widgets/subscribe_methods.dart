import 'package:flutter/material.dart';
import 'package:salon_app/core/constants/app_colors.dart';
import 'package:salon_app/core/widgets/GradientClickableButton.dart';

class SubscribeMethods extends StatefulWidget {
  const SubscribeMethods({super.key});

  @override
  State<SubscribeMethods> createState() => _SubscribeMethodsState();
}
  bool isFree = false;

class _SubscribeMethodsState extends State<SubscribeMethods> {
  @override
  Widget build(BuildContext context) {
    return  Column(children: [
          GradientButton(
                  text: "One Year Subscription",
                  onPressed: () {},
                  textColor: Color.fromRGBO(38, 38, 60, 1),
                  firstColor: Color.fromRGBO(241, 241, 241, 1),
                  secondColor: Color.fromRGBO(241, 241, 241, 1)
                ),
                GradientButton(text: isFree ?"Free Subscription": "Payment" , onPressed: (){setState(() {
                  isFree = !isFree;
                });},secondColor: AppColors.primarycolor,)
    ],);
  }
}