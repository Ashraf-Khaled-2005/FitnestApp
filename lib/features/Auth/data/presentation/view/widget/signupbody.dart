import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../../../../../core/widget/buttom.dart';
import '../../../../../../core/widget/textfield.dart';
import '../profilecontinue.dart';
import '../LoginView.dart';
import 'logincontainuer.dart';

class SignupBody extends StatefulWidget {
  const SignupBody({super.key});

  @override
  State<SignupBody> createState() => _SignupBodyState();
}

class _SignupBodyState extends State<SignupBody> {
  late String email, pass, f_name, L_name;
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
                const Text(
                  'Hey there,',
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins'),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Create An Account',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextField(
                  onSaved: (newvalue) {
                    f_name = newvalue!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Field is requried";
                    }
                  },
                  icon: Icons.person,
                  text: "First Name",
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  onSaved: (newvalue) {
                    L_name = newvalue!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Field is requried";
                    }
                  },
                  icon: Icons.person,
                  text: "Last Name",
                ),
                const SizedBox(
                  height: 15,
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
                const SizedBox(
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
              customButtom(
                  w: w,
                  ontap: () async {
                    if (key.currentState!.validate()) {
                      key.currentState!.save();

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileContinue(
                            pass: pass,
                            email: email,
                            f_name: f_name,
                            l_name: L_name,
                          ),
                        ),
                      );

                      log("done");
                    } else {
                      setState(() {
                        auto = AutovalidateMode.always;
                      });
                    }
                  },
                  text: "Register"),
              const SizedBox(
                height: 20,
              ),
            
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already Have An account !",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins'),
                  ),
                  TextButton(
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Loginview()));
                      },
                      child: Text('Login',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins',
                              color: Colors.black.withOpacity(.5))))
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
