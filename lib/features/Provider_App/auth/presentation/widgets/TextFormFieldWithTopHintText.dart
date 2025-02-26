import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextFormFieldWithTopText extends StatelessWidget {
  const TextFormFieldWithTopText({super.key,required this.controller,required this.topText,required this.hintText,required this.prefixIcon,this.suffixIcon});

  final String topText;
  final TextEditingController controller;
  final String hintText;
  final Widget prefixIcon;
  final Widget? suffixIcon;
  

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          topText,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        Card(
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Color.fromRGBO(203, 203, 203, 1)),
              borderRadius: BorderRadius.circular(16)),
          child: TextFormField(
            
              controller: controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.white,
                hintText: hintText.tr(),
                contentPadding: EdgeInsets.all(20),
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon ,
                
              )),
        ),
      ],
    );
  }
}
