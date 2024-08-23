import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/features/Auth/data/presentation/manager/loginemail_pass_cubit/loginemail_pass_cubit.dart';
import 'package:fitness_app/features/Auth/data/presentation/view/LoginView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:uuid/uuid.dart';

import '../../../../../../core/widget/buttom.dart';
import '../../../../../../core/widget/textfield.dart';
import '../signup.dart';
import 'logincontainuer.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  late String email, pass;
  GlobalKey<FormState> key = GlobalKey();
  AutovalidateMode auto = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.sizeOf(context).width;
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Form(
            key: key,
            autovalidateMode: auto,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Hey there,',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins'),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Welcome Back',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 30,
                ),
                CustomTextField(
                  onSaved: (newvalue) {
                    email = newvalue!;
                  },
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return "vaild Field  is requried";
                    }
                  },
                  icon: Icons.email,
                  text: "Email",
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  onSaved: (newvalue) {
                    pass = newvalue!;
                  },
                  validator: (value) {
                    if (value!.isEmpty || value.length <= 8) {
                      return "Field is requried and don't less than 8";
                    }
                  },
                  icon: Icons.lock,
                  text: "Password",
                  pass: true,
                )
              ],
            ),
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              const Spacer(),
              customAuthButtom(
                w: w,
                ontap: () async {
                  if (key.currentState!.validate()) {
                    key.currentState!.save();
                    await context
                        .read<LoginemailPassCubit>()
                        .LoginWithEmailPass(email: email, pass: pass);
                  } else {
                    setState(() {
                      auto = AutovalidateMode.always;
                    });
                  }
                },
                text: "Login",
              ),
              const SizedBox(
                height: 20,
              ),
              Image.asset('assets/image/or.png'),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomLoginMethodContainuer(
                    logo: 'assets/image/google.png',
                    onTap: () async {
                      final uuid = Uuid().v4();
                      var user = await signInWithGoogle();
                    },
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  CustomLoginMethodContainuer(
                    logo: 'assets/image/Vector.png',
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't Have an account?",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins'),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Signup(),
                        ),
                      );
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Poppins',
                          color: Colors.black.withOpacity(.5)),
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  Future<UserCredential?> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser != null) {
      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } else {}
  }
}
