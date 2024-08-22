import 'package:fitness_app/features/Auth/data/presentation/manager/SIgninAuthCubit/SIgninAuthCubit.dart';
import 'package:fitness_app/features/Auth/data/presentation/manager/SIgninAuthCubit/SIgninAuthCubitstate.dart';
import 'package:fitness_app/features/Auth/data/presentation/view/Gender_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
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
