import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String myHint;
  bool myObscuredtext;
  TextInputType myKeyboard;
  IconData myPrefixIcon;
  Function onClick;

  CustomTextField(
      {required this.myHint,
      required this.myKeyboard,
      required this.myObscuredtext,
      required this.myPrefixIcon,
      required this.onClick});

  get kSecondaryColor => null;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        onChanged: (value) {
          onClick;
        },
        obscureText: myObscuredtext,
        keyboardType: myKeyboard,
        decoration: InputDecoration(
            filled: true,
            fillColor: kSecondaryColor,
            hintText: myHint,
            hintStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: Colors.white, width: 3)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: Colors.white, width: 3)),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 20, right: 10),
              child: Icon(
                myPrefixIcon,
                color: Colors.black,
              ),
            )),
      ),
    );
  }
}
