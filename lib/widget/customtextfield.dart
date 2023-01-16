import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String myHint;
  bool myObscuredtext;
  TextInputType myKeyboard;
  IconData myPrefixIcon;
  Function onClick;

  String _errorMessage(String str) {
    switch (myHint) {
      case 'Enter your Name':
        return 'Name is missing';
      case 'Enter your Email':
        return 'Email is missing';
      case 'Enter your password':
        return 'password is missing';
    }
    return 'Something went wrong';
  }

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
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return _errorMessage(myHint);
          }
        },
        style:
            const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        onChanged: (value) {
          onClick;
        },
        obscureText: myObscuredtext,
        keyboardType: myKeyboard,
        decoration: InputDecoration(
            filled: true,
            fillColor: kSecondaryColor,
            hintText: myHint,
            hintStyle: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white),
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: Colors.white, width: 3)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: Colors.white, width: 3)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: Colors.white, width: 3)),
            errorBorder: OutlineInputBorder(
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
