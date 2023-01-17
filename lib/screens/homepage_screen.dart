import 'package:flutter/material.dart';

import '../constants/constants.dart';

class HomePage extends StatelessWidget {
  static String id = 'home page';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
    );
  }
}
