import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fitness_app/features/Auth/data/auth_repo_imlp.dart';
import 'package:fitness_app/features/Auth/presentation/manager/SIgninAuthCubit/SIgninAuthCubit.dart';
import 'package:fitness_app/features/Auth/presentation/manager/cubit/loginwithgoogle_cubit.dart';
import 'package:fitness_app/features/Auth/presentation/manager/loginemail_pass_cubit/loginemail_pass_cubit.dart';
import 'package:fitness_app/features/Auth/presentation/view/LoginView.dart';
import 'package:fitness_app/features/Auth/presentation/view/signup.dart';
import 'package:fitness_app/features/Home/presentation/manager/cubit/getuserdata_cubit.dart';
import 'package:fitness_app/features/Home/presentation/view/Home_page.dart';
import 'package:fitness_app/features/exercises/data/repo/exerciserepoimpl.dart';
import 'package:fitness_app/features/exercises/presentation/manager/indesesCubit/getexerciseindeses_cubit.dart';
import 'package:fitness_app/features/onboarding/presentation/view/splash.dart';
import 'package:fitness_app/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/service/local_notication_Service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Future.wait([
    NotificationService.init(),
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    )
  ]);

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
          create: (context) => GetuserdataCubit(),
        ),
        BlocProvider(
          create: (context) => LoginwithgoogleCubit(AuthRepoImpl()),
        ),
        BlocProvider(
          create: (context) => LoginemailPassCubit(AuthRepoImpl()),
        ),
        BlocProvider(
          create: (context) =>
              GetexerciseindesesCubit(Exerciserepoimple(dio: Dio())),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Poppins',
        ),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}

class AuthStream extends StatelessWidget {
  final bool isgoogle;

  const AuthStream({super.key, this.isgoogle = false});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Waiting for the stream to emit a value
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          // An error occurred in the stream
          return Scaffold(
            body: Center(
                child: Text('An error occurred. Please try again later.')),
          );
        } else if (snapshot.hasData) {
          context.read<GetuserdataCubit>().getuserdata();
          return HomeView(
            isgoogle: isgoogle,
          );
        } else if (snapshot.connectionState == ConnectionState.active) {
          // The stream is active but no user is signed in (i.e., user is not logged in)
          return Signup();
        } else {
          // Fallback case for unexpected situations
          return Scaffold(
            body: Center(
                child: Text('Something went wrong. Please restart the app.')),
          );
        }
      },
    );
  }
}
