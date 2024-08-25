import 'package:fitness_app/features/exercises/presentation/manager/indesesCubit/getexerciseindeses_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/exercise_model.dart';
import 'widget/ExerciseShowwingbody.dart';

class ExerciseShowwing extends StatelessWidget {
  final ExerciseModel model;
  const ExerciseShowwing({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 40),
        child: BlocConsumer<GetexerciseindesesCubit, GetexerciseindesesState>(
          listener: (context, state) {
            if (state is GetexerciseindesesLoaded) {
            } else if (state is GetexerciseindesesError) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("data"),
              ));
            }
          },
          builder: (context, state) {
            if (state is GetexerciseindesesLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GetexerciseindesesLoaded) {
              return ExerciseShowwingbody(
                model: model,
                done: state.exercise,
              );
            } else if (state is GetexerciseindesesError) {
              return Center(
                child: Text("error"),
              );
            } else {
              return ExerciseShowwingbody(
                done: null,
                model: model,
              );
            }
          },
        ),
      ),
    );
  }
}
