import 'dart:developer';

import 'package:fitness_app/features/Auth/presentation/manager/cubit/loginwithgoogle_cubit.dart';
import 'package:fitness_app/features/Auth/presentation/manager/loginemail_pass_cubit/loginemail_pass_cubit.dart';
import 'package:fitness_app/features/Auth/presentation/view/profilecontinue.dart';
import 'package:fitness_app/features/Home/presentation/manager/cubit/getuserdata_cubit.dart';
import 'package:fitness_app/features/Home/presentation/view/Home_page.dart';
import 'package:fitness_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widget/buttom.dart';
import '../../../../../core/widget/textfield.dart';
import '../signup.dart';
import 'logincontainuer.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  bool ispassvis = false;
  bool ispass = false;
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
                  'Welcome Back',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
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
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  suffix: ispassvis
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              ispassvis = !ispassvis;
                              ispass = !ispass;
                            });
                          },
                          icon: Icon(Icons.visibility_off))
                      : IconButton(
                          onPressed: () {
                            setState(() {
                              ispass = !ispass;

                              ispassvis = !ispassvis;
                            });
                          },
                          icon: Icon(Icons.visibility)),
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
                  pass: !ispass,
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
                  BlocListener<LoginwithgoogleCubit, LoginwithgoogleState>(
                    listener: (context, state) async {
                      if (state is Loginwithgooglesuccess) {
                        if (state
                            .usercredential!.additionalUserInfo!.isNewUser) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfileContinue(
                                  image: state.googlesignin!.photoUrl ?? " ",
                                  isgoogle: true,
                                  l_name: "",
                                  f_name: state.googlesignin!.displayName!,
                                  email: state.googlesignin!.email,
                                  pass: ""),
                            ),
                          );
                        } else {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AuthStream(
                                isgoogle: true,
                              ),
                            ),
                          );
                        }
                      } else if (state is Loginwithgooglefailure) {
                        // Show a snackbar with the error message
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content:
                                  Text('Google Login Failed: ${state.err}')),
                        );
                        log(state.err); // Optional: keep logging for debugging
                      }
                    },
                    child: CustomLoginMethodContainuer(
                      logo: 'assets/image/google.png',
                      onTap: () async {
                        await context
                            .read<LoginwithgoogleCubit>()
                            .LoginWithGoogle();
                      },
                    ),
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
}
