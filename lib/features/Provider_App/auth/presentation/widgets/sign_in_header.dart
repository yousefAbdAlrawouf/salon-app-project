import 'package:flutter/material.dart';

class SignInHeader extends StatelessWidget {
  const SignInHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
              child: Text("Logo",
                  style: TextStyle(fontSize: 45, color: Colors.white))),
          Text("Have A Business Account?",
              style: TextStyle(
                  color: Color.fromRGBO(252, 252, 252, 1),
                  fontFamily: "Meditative",
                  fontSize: 35)),
          Padding(
            padding: const EdgeInsets.only(right: 65.0, left: 65),
            child: ElevatedButton(
                onPressed: () {},
                child: Center(
                    child: Text(
                  "Join as a partner",
                  style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700),
                ))),
          )
        ],
      ),
    );
  }
}
