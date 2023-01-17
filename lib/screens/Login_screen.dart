// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:newecommerce1123/screens/homepage_screen.dart';
import 'package:newecommerce1123/screens/signup_screen.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../provider/modelhud.dart';
import '../services/auth.dart';
import '../widget/customRow.dart';
import '../widget/customTextButton.dart';
import '../widget/customtextfield.dart';

class LoginScreen extends StatelessWidget {
  static String id = 'Login screen';
  String _email = '', _password = "";
  LoginScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<ModelHud>(context).isLoading,
        child: Form(
          key: _globalKey,
          child: ListView(
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
                          image:
                              AssetImage('assets/images/icons8-buy-100.png')),
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
                height: 10,
              ),
              CustomTextField(
                  myHint: 'Enter your Email',
                  myKeyboard: TextInputType.emailAddress,
                  myObscuredtext: false,
                  myPrefixIcon: Icons.email,
                  onClick: (value) {
                    _email = value;
                  }),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                  myHint: 'Enter your password',
                  myKeyboard: TextInputType.text,
                  myObscuredtext: true,
                  myPrefixIcon: Icons.lock,
                  onClick: (value) {
                    _password = value;
                  }),
              SizedBox(
                height: 89,
              ),
              CustomTextButton(
                myButtonTitle: 'Log in',
                onClick: () async {
                  final modelhud =
                      Provider.of<ModelHud>(context, listen: false);
                  modelhud.changeisLoading(true);
                  if (_globalKey.currentState!.validate()) {
                    try {
                      final authResult = await Auth().logIn(_email, _password);
                      print(authResult.user.uid);
                      modelhud.changeisLoading(false);
                      Navigator.popAndPushNamed(context, HomePage.id);
                    } on FirebaseException catch (e) {
                      modelhud.changeisLoading(false);
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(e.message!)));
                    }
                  }
                  modelhud.changeisLoading(false);
                },
              ),
              SizedBox(
                height: 20,
              ),
              CustomRow(
                myButtonTitle: 'Sign up',
                onClick: () {
                  Navigator.popAndPushNamed(context, SignupScreen.id);
                },
                myquestion: 'Do not have an account yet?',
              )
            ],
          ),
        ),
      ),
    );
  }
}
