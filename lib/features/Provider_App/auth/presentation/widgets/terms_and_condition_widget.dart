import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsWidget extends StatefulWidget {
  @override
  _TermsAndConditionsWidgetState createState() => _TermsAndConditionsWidgetState();
}

class _TermsAndConditionsWidgetState extends State<TermsAndConditionsWidget> {
  bool isChecked = false;

  void _onCheckboxChanged(bool? value) {
    setState(() {
      isChecked = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Checkbox(
            value: isChecked,
            onChanged: _onCheckboxChanged,
            activeColor: Color.fromRGBO(166, 77, 121, 1), // Custom color for the checkbox
            checkColor: Colors.white, // Color of the checkmark
          ),
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: TextStyle(fontSize: 14, color: Colors.black),
              children: [
                TextSpan(text: "By Continuing you agree to "),
                TextSpan(
                  text: "Deyram",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Color.fromRGBO(166, 77, 121, 1),
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      print("Deyram Term of Use clicked");
                      // Handle Deyram Term of Use click here
                    },
                ),
                TextSpan(text: " Term of use, you may read our "),
                TextSpan(
                  text: "privacy policy",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Color.fromRGBO(166, 77, 121, 1),
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      print("Privacy Policy clicked");
                      // Handle Privacy Policy click here
                    },
                ),
                TextSpan(text: " here"),
              ],
            ),
          ),
        ),
      ],
    );
  }
}