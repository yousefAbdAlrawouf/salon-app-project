import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:salon_app/core/routes/routes_path.dart';
import 'package:slide_to_act/slide_to_act.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 15, left: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Welcome Back",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 45,
                    fontFamily: "Meditative"),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                  children: [
                    TextSpan(text: "Let us add a magical touch to  "),
                    TextSpan(
                      text: "your beauty",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: SlideAction(
                  sliderButtonIconPadding: 0,
                  borderRadius: 24,
                  onSubmit: () {
                    context.go(RoutesPath.signIn);
                    return null;
                  },
                  text: "",
                  reversed: false,
                  sliderRotate: false,
                  innerColor: Colors.transparent,
                  outerColor: Color.fromRGBO(255, 247, 243, 1),
                  sliderButtonIcon: Container(
                    width: 180,
                    height: 65,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(166, 77, 121, 1),
                          Color.fromRGBO(225, 149, 171, 1),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(26),
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Swipe to Continue ",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        Icon(Icons.arrow_forward_ios_sharp,
                            color: Colors.white, size: 16),
                        Icon(Icons.arrow_forward_ios_sharp,
                            color: Colors.white, size: 16),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 70)
            ],
          ),
        ),
      ),
    );
  }
}
