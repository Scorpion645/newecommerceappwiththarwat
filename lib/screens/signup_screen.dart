// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newecommerceapp/screens/home_page_screen.dart';
import 'package:newecommerceapp/screens/login_screen.dart';
import 'package:newecommerceapp/services/auth.dart';

import '../constants.dart';
import '../widgets/customtextfield.dart';

class SignupScreen extends StatelessWidget {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final _globalKeys = GlobalKey<ScaffoldMessengerState>();

  static String id = 'sigupscreen';

  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  late String _email, _password;
  final _auth = Auth();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kMainColor,
      body: Form(
        key: _globalKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Container(
                height: height * 0.2,
                child: Stack(
                  alignment: Alignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Image(image: AssetImage('images/icons/buyicon.png')),
                    Positioned(
                      bottom: 0,
                      child: Text('Buy it',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              fontFamily: 'pacifico')),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height * 0.1,
            ),
            CustomTextField(
              hint: 'Enter your name',
              icon: Icons.person,
              onClick: (value) {
                // _email = value!;
              },
            ),
            SizedBox(
              height: height * 0.02,
            ),
            CustomTextField(
              hint: 'Enter your Email',
              icon: Icons.email,
              onClick: (value) {
                _email = value!;
              },
            ),
            SizedBox(
              height: height * 0.02,
            ),
            CustomTextField(
              hint: 'Enter your password',
              icon: Icons.lock,
              onClick: (value) {
                _password = value!;
              },
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120),
              child: Container(
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black,
                ),
                child: Builder(builder: (context) {
                  // BuildContext scaffoldContext;
                  // scaffoldContext = context;
                  return TextButton(
                      onPressed: () async {
                        if (_globalKey.currentState!.validate()) {
                          _globalKey.currentState?.save();
                          try {
                            print(_email);
                            print(_password);
                            final authResult =
                                await _auth.signUp(_email, _password);
                            print(authResult.user.uid);
                            Navigator.pushNamed(context, HomePage.id);
                            // ignore: empty_catches
                          } on FirebaseException catch (e) {
                            print(e.toString());
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message!)));
                             
                            // ScaffoldMessenger.of(context).showSnackBar(
                            //     SnackBar(content: Text(e.message)));
                          }
                        }
                      },
                      child: Text('Sign up',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white,
                              backgroundColor: Colors.black)));
                }),
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account?  ',
                    style: TextStyle(fontSize: 16, color: Colors.white)),
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, LoginScreen.id);
                    },
                    child: Text('Sign in',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)))
              ],
            )
          ],
        ),
      ),
    );
  }
}
