import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? firstColor;
  final Color? secondColor;
  final Color? textColor;

  const GradientButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.firstColor,
    this.secondColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24), 
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      child: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              firstColor ?? const Color.fromRGBO(166, 77, 121, 1),
              secondColor ?? const Color.fromRGBO(225, 149, 171, 1),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(24), 
        ),
        child: Container(
          alignment: Alignment.center,
          constraints: const BoxConstraints(minWidth: 50, minHeight: 50),
          child: Text(
            text,
            style: TextStyle(
              color: textColor ?? Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}