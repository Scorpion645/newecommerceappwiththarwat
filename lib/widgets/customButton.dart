// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String buttonTitle;
  Function()? buttonFunction;

  CustomButton({super.key, required this.buttonFunction, required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 120),
      child: TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ))),
          onPressed: buttonFunction,
          child: Text(buttonTitle,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  color: Colors.white))),
    );
  }
}
