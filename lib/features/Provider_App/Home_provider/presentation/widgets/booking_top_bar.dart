
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:salon_app/core/constants/app_colors.dart';

// ignore: must_be_immutable
class BookingTopBarState extends StatefulWidget {
   BookingTopBarState({super.key,this.tapTitle,this.secoundTapTitle,this.thirdTapTitle});

  String? tapTitle;
  String? secoundTapTitle;
  String? thirdTapTitle;

  @override
  State<BookingTopBarState> createState() => _BookingTopBarStateState();
}

class _BookingTopBarStateState extends State<BookingTopBarState> {
  int index = 0; 

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildTab(widget.tapTitle ??"Pending", 0),
        _buildTab(widget.secoundTapTitle ??"Today", 1),
        _buildTab(widget.thirdTapTitle ??"Canceled", 2),
      ],
    );
  }

  Widget _buildTab(String title, int tabIndex) {
    bool isSelected = index == tabIndex;

    return Expanded(
      child: TextButton(
        onPressed: () {
          setState(() {
            index = tabIndex;
          });
        },
        style: TextButton.styleFrom(padding: EdgeInsets.zero),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title.tr(),
              style: TextStyle(
                fontFamily: "Meditative",
                fontSize: 24,
                color: isSelected ? AppColors.primarycolor : Color.fromRGBO(164, 164, 164, 1),
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            SizedBox(height: 4), 
            Container(
              height: 3, 
              color: isSelected ? AppColors.primarycolor : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}