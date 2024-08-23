import 'package:fitness_app/features/exercises/presentation/manager/cubit/exercise_get_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'exercisebody.dart';

class exerciseBodyBloc extends StatelessWidget {
  const exerciseBodyBloc({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 40),
      child: BlocConsumer<ExerciseGetDataCubit, ExerciseGetDataState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is ExerciseGetDataLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ExerciseGetDataFailure) {
            return Center(
              child: Text(state.err),
            );
          } else if (state is ExerciseGetDataSuccess) {
            return ExercisesViewBody(list: state.exercises);
          } else {
            return Text('data');
          }
        },
      ),
    );
  }
}
