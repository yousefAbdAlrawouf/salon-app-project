import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GradientBackgroundScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  Color? firstcolor;
  Color? secoundColor;



   GradientBackgroundScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.firstcolor,
    this.secoundColor
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              firstcolor ?? Color.fromRGBO(166, 77, 121, 1),
              secoundColor ?? Color.fromRGBO(225, 149, 171, 1)
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: body,
      ),
    );
  }
}
