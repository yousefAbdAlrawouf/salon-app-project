
import 'package:flutter/material.dart';

class GradientAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
    const GradientAppBar({super.key, this.title="" });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title,style: TextStyle(color: Colors.white),),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(166, 77, 121, 1),
              Color.fromRGBO(225, 149, 171, 1),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight); // Default AppBar height
}