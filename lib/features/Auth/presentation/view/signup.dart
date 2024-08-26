import 'package:flutter/material.dart';
import 'widget/signupbody.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 40.0, left: 30, right: 30, bottom: 40),
        child: SignupBody(),
      ),
    );
  }
}
