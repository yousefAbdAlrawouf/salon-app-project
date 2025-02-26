import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      child: const Center(
        child: Text(
          "Logo",
          style: TextStyle(color: Colors.white, fontSize: 45),
        ),
      ),
    );
  }
}
