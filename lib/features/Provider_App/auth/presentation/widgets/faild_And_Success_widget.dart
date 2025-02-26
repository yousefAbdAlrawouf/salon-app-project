import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salon_app/core/constants/app_colors.dart';

class FaildAndSuccessWidget extends StatelessWidget {
  const FaildAndSuccessWidget({super.key,required this.assetIcon,required this.color,this.text});
  final String? text;
  final Color color;
  final String assetIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
            backgroundColor: color,
            child: SvgPicture.asset("assets/icons/$assetIcon.svg",height: 20,width: 20,)),
        SizedBox(width: 12),
        Flexible(
            child: Text(
          "Lorem Ipsum Dolor Sit Amet, Consectetur this Adipiscing Elit, Sed Do Eiusmod",
          style: TextStyle(color: AppColors.subscripeTextColor),
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ))
      ],
    );
  }
}
