import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  String myButtonTitle;
  String myquestion;
  VoidCallback onClick;

  CustomRow(
      {super.key,
      required this.myButtonTitle,
      required this.onClick,
      required this.myquestion});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(myquestion),
        TextButton(
            onPressed: onClick,
            child: Text(myButtonTitle,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black)))
      ],
    );
  }
}
