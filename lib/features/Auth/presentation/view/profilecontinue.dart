import 'dart:io';

import 'package:fitness_app/features/Auth/presentation/manager/SIgninAuthCubit/SIgninAuthCubit.dart';
import 'package:fitness_app/features/Auth/presentation/manager/SIgninAuthCubit/SIgninAuthCubitstate.dart';
import 'package:fitness_app/features/Home/presentation/manager/cubit/getuserdata_cubit.dart';
import 'package:fitness_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'widget/completeprofilebody.dart';

class ProfileContinue extends StatelessWidget {
  final bool isgoogle;
  final String l_name, f_name, email, pass;
  const ProfileContinue(
      {super.key,
      required this.l_name,
      required this.f_name,
      required this.email,
      required this.pass,
      this.isgoogle = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 15),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) async {
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
              ),
            );
          } else if (state is AuthSuccess) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => AuthStream(),
                ));
          } else {}
        },
        builder: (context, state) {
          return ModalProgressHUD(
              inAsyncCall: state is AuthLoading ? true : false,
              child: ProfileContinueBody(
                isgoogle: isgoogle,
                email: email,
                f_name: f_name,
                l_name: l_name,
                pass: pass,
              ));
        },
      ),
    ));
  }
}
