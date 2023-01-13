// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:newecommerce1123/constants/constants.dart';

class CustomTextField extends StatelessWidget {
  final String myHintText;
  final IconData myIcon;
  final TextInputType myKeyboardType;
  final bool myObscuredText;

  CustomTextField(
      {super.key, required this.myHintText,
      required this.myKeyboardType,
      required this.myObscuredText, required this.myIcon,
       });
      
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 18,
        ),
        keyboardType: myKeyboardType,
        obscureText: myObscuredText,
        cursorColor: kMainColor,
        decoration: InputDecoration(
          fillColor: kSecondaryColor,
          hintText: myHintText,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 20, right: 10),
            child: Icon(myIcon),
          ),
          prefixIconColor: Colors.black,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(width: 3, color: kSecondaryColor)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(width: 3, color: kSecondaryColor)),
        ),
      ),
    );
  }
}
