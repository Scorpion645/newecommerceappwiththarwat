// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widget/customtextfield.dart';

class LoginScreen extends StatelessWidget {
  static String id = 'HomePage';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: ListView(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          // ignore: prefer_const_constructors
          SizedBox(
            height: 30,
          ),
          Stack(
              alignment: Alignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Padding(
                  padding: const EdgeInsets.all(50),
                  child: Image(
                      image: AssetImage('assets/images/icons8-buy-100.png')),
                ),
                Positioned(
                  bottom: 0,
                  child: Text('Buy it',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.black,
                        fontFamily: 'pacifico',
                      )),
                )
              ]),
              SizedBox(height: 10,),
          CustomTextField(
              myHint: 'Enter your Email',
              myKeyboard: TextInputType.emailAddress,
              myObscuredtext: false,
              myPrefixIcon: Icons.email,
              onClick: () {})
        ],
      ),
    );
  }
}
