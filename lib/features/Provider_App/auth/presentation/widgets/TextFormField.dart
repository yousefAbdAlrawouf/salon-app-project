import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
    this.isPassword = false, 
  });

  final TextEditingController controller;
  final String hintText;
  final Widget prefixIcon;
  final Widget? suffixIcon;
  final bool isPassword; 

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _isObscured = true; 

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.isPassword ? _isObscured : false, 
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color.fromRGBO(203, 203, 203, 1)),
        ),
        hintText: widget.hintText.tr(),
        contentPadding: const EdgeInsets.all(16),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _isObscured
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
                onPressed: () {
                  setState(() {
                    _isObscured = !_isObscured; 
                  });
                },
              )
            : widget.suffixIcon, 
        prefixIcon: widget.prefixIcon,
      ),
    );
  }
}