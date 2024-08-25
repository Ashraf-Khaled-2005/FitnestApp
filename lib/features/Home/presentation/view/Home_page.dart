import 'package:fitness_app/core/widget/buttom.dart';
import 'package:fitness_app/features/Auth/data/domain/model/userModel.dart';
import 'package:fitness_app/features/Auth/data/presentation/manager/SIgninAuthCubit/SIgninAuthCubit.dart';
import 'package:fitness_app/features/exercises/presentation/view/exercisesview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: HomeViewBody());
  }
}

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomProfileView(user: context.read<AuthCubit>().user),
        customButtom(
          w: double.infinity,
          ontap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ExercisesView()),
            );
          },
        ),
      ],
    );
  }
}

class CustomProfileView extends StatelessWidget {
  final Usermodel user;
  const CustomProfileView({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 32,
        backgroundColor: Color(0xffE0ECFF),
        child: Image.asset('assets/image/Vector-Exercises.png'),
      ),
      title: Text(
        "${user.f_name} ${user.L_name}",
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w700, fontSize: 16),
      ),
      subtitle: Text(
        user.email,
        style: TextStyle(
            color: Colors.black.withOpacity(.5),
            fontWeight: FontWeight.w500,
            fontSize: 14),
      ),
    );
  }
}
