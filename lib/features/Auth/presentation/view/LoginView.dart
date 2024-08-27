import 'package:fitness_app/features/Auth/presentation/manager/loginemail_pass_cubit/loginemail_pass_cubit.dart';
import 'package:fitness_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'widget/loginbody.dart';

class Loginview extends StatelessWidget {
  const Loginview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 40.0, left: 30, right: 30, bottom: 40),
        child: BlocConsumer<LoginemailPassCubit, LoginemailPassState>(
          listener: (context, state) async {
            if (state is LoginError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                ),
              );
            } else if (state is LoginSuccess) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AuthStream(),
                  ));
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
                inAsyncCall: state is LoginLoading ? true : false,
                child: LoginViewBody());
          },
        ),
      ),
    );
  }
}
