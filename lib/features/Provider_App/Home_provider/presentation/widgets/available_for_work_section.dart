import 'package:flutter/material.dart';
import 'package:salon_app/core/constants/app_colors.dart';

class AvailableForWorkSection extends StatefulWidget {
  const AvailableForWorkSection({super.key});

  @override
  State<AvailableForWorkSection> createState() => _AvailableForWorkSectionState();
}
  bool isSwitched = false;


class _AvailableForWorkSectionState extends State<AvailableForWorkSection> {
  @override
  Widget build(BuildContext context) {
    return   SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
              Text(
                isSwitched ? "Available for work" : "Not available for work",
                style: TextStyle(
                    color: isSwitched ? AppColors.primarycolor : AppColors.greyColor),
              ),
              Switch(
                activeTrackColor: AppColors.primarycolor,
                activeColor: Colors.white,
                inactiveTrackColor: Colors.white,
                inactiveThumbColor: AppColors.greyColor,
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  })
            ]),
    );
  }
}