import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/core/widget/buttom.dart';
import 'package:fitness_app/features/Auth/domain/model/userModel.dart';
import 'package:fitness_app/features/Home/presentation/manager/cubit/getuserdata_cubit.dart';
import 'package:fitness_app/features/exercises/presentation/view/exercisesview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  final bool isgoogle;
  const HomeView({super.key, this.isgoogle = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: HomeViewBody());
  }
}

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetuserdataCubit, GetuserdataState>(
      builder: (context, state) {
        if (state is Getuserdataloading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is Getuserdatasucess) {
          Usermodel user = state.user;
          return Column(
            children: [
              CustomProfileView(user: user),
              customButtom(
                w: double.infinity,
                ontap: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ExercisesView()),
                  );
                },
              ),
            ],
          );
        } else if (state is Getuserdatafail) {
          return Center(child: Text('Error: ${state.err}'));
        } else {
          return const Center(child: Text('Unexpected state!'));
        }
      },
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
