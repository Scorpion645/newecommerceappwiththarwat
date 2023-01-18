import 'package:flutter/material.dart';

import '../constants/constants.dart';

class CustomTextField extends StatelessWidget {
  final String myHint;
  final IconData myIcon;
  final TextInputType myKeyboard;
  final bool myObscured;
  void Function(String value)? onClick;

  CustomTextField(
      {required this.myHint,
      required this.myIcon,
      required this.myKeyboard,
      required this.myObscured, 
      required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        onChanged: onClick,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Missing information';
          }
          return 'Great Job';
        },
        keyboardType: myKeyboard,
        style:
            const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        decoration: InputDecoration(
          hintText: myHint,
          hintStyle:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 20, right: 10),
            child: Icon(
              myIcon,
              color: Colors.black,
            ),
          ),
          border: InputBorder.none,
          filled: true,
          fillColor: kSecondaryColor,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(width: 2, color: Colors.white)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(width: 2, color: Colors.white)),
        ),
        obscureText: myObscured,
      ),
    );
  }
}
