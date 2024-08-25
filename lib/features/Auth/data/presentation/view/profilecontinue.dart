import 'package:fitness_app/features/Auth/data/presentation/manager/SIgninAuthCubit/SIgninAuthCubit.dart';
import 'package:fitness_app/features/Auth/data/presentation/manager/SIgninAuthCubit/SIgninAuthCubitstate.dart';
import 'package:fitness_app/features/Home/presentation/view/Home_page.dart';
import 'package:fitness_app/features/exercises/presentation/view/exercisesview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'widget/completeprofilebody.dart';

class ProfileContinue extends StatelessWidget {
  final String l_name, f_name, email, pass;
  const ProfileContinue(
      {super.key,
      required this.l_name,
      required this.f_name,
      required this.email,
      required this.pass});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 15),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
              ),
            );
          } else if (state is AuthSuccess) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeView(),
                ));
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
              inAsyncCall: state is AuthLoading ? true : false,
              child: ProfileContinueBody(
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
