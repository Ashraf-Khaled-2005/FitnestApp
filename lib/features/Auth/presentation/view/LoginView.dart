import 'package:fitness_app/features/Auth/presentation/manager/loginemail_pass_cubit/loginemail_pass_cubit.dart';
import 'package:fitness_app/features/Home/presentation/manager/cubit/getuserdata_cubit.dart';
import 'package:fitness_app/features/Home/presentation/view/Home_page.dart';
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
          listener: (context, state) {
            if (state is LoginError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                ),
              );
            } else if (state is LoginSuccess) {
              context.read<GetuserdataCubit>().getuserdata();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("donesada"),
                ),
              );
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeView(),
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
