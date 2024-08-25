import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fitness_app/features/Auth/data/auth_repo_imlp.dart';
import 'package:fitness_app/features/Auth/data/presentation/manager/SIgninAuthCubit/SIgninAuthCubit.dart';
import 'package:fitness_app/features/Auth/data/presentation/manager/loginemail_pass_cubit/loginemail_pass_cubit.dart';
import 'package:fitness_app/features/Auth/data/presentation/view/signup.dart';
import 'package:fitness_app/features/exercises/data/repo/exerciserepoimpl.dart';
import 'package:fitness_app/features/exercises/presentation/manager/indesesCubit/getexerciseindeses_cubit.dart';
import 'package:fitness_app/features/onboarding/presentation/view/splash.dart';
import 'package:fitness_app/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/exercises/presentation/view/exercisesview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const FitnessApp());
}

class FitnessApp extends StatelessWidget {
  const FitnessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(AuthRepoImpl()),
        ),
        BlocProvider(
          create: (context) => LoginemailPassCubit(AuthRepoImpl()),
        ),
        BlocProvider(
          create: (context) =>
              GetexerciseindesesCubit(Exerciserepoimple(dio: Dio())),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
