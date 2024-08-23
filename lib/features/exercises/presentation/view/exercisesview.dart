import 'package:dio/dio.dart';
import 'package:fitness_app/features/exercises/data/repo/exerciserepoimpl.dart';
import 'package:fitness_app/features/exercises/presentation/manager/cubit/exercise_get_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widget/exerciseBodyBloc.dart';
import 'widget/exercisebody.dart';

class ExercisesView extends StatelessWidget {
  const ExercisesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ExerciseGetDataCubit(Exerciserepoimple(dio: Dio()))..getData(),
      child: Scaffold(
        body: exerciseBodyBloc(),
      ),
    );
  }
}
