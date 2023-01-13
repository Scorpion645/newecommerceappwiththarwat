// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:newecommerce1123/screens/Login_screen.dart';
import 'package:newecommerce1123/widgets/customtextfield.dart';

import '../constants/constants.dart';

class SignupScreen extends StatelessWidget {
  static String id = 'Signupscreen';
  const SignupScreen({Key? key}) : super(key: key);

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
          SizedBox(
            height: 20,
          ),
          CustomTextField(
            myHintText: 'Enter your name',
            myIcon: Icons.person,
            myKeyboardType: TextInputType.emailAddress,
            myObscuredText: false,
          ),
          SizedBox(
            height: 20,
          ),
          CustomTextField(
              myHintText: 'Enter your Email',
              myIcon: Icons.email,
              myKeyboardType: TextInputType.none,
              myObscuredText: false),
          SizedBox(
            height: 20,
          ),
          CustomTextField(
              myHintText: 'Enter your password',
              myIcon: Icons.lock,
              myKeyboardType: TextInputType.none,
              myObscuredText: true),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 120),
            child: TextButton(
              onPressed: () {},
              // ignore: sort_child_properties_last
              child: Text('Sign up',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                      backgroundColor: Colors.black)),

              style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: 10)),
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(70),
                  ))),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Already have an account yet?',
                  style: TextStyle(fontSize: 16)),
              TextButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, LoginScreen.id);
                  },
                  child: Text('Log in',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black)))
            ],
          )
        ],
      ),
    );
  }
}
