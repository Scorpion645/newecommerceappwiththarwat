// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  String firstText;
  String secondText;
  final Function()? onPressed;

  CustomRow(
      {required this.firstText, required this.secondText, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(firstText),
        TextButton(
            onPressed: onPressed,
            child: Text(secondText,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black)))
      ],
    );
  }
}
