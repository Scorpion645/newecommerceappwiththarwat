// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  String myButtonTitle;
  VoidCallback onClick;

  CustomTextButton({super.key, required this.myButtonTitle, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 120),
      child: TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)))),
          onPressed: onClick,
          child: Text(myButtonTitle,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.white,
                  backgroundColor: Colors.black))),
    );
  }
}
