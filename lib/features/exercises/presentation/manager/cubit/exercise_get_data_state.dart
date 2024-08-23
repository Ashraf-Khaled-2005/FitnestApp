part of 'exercise_get_data_cubit.dart';

@immutable
sealed class ExerciseGetDataState {}

final class ExerciseGetDataInitial extends ExerciseGetDataState {}

final class ExerciseGetDataLoading extends ExerciseGetDataState {}

final class ExerciseGetDataSuccess extends ExerciseGetDataState {
  final List<List<ExerciseModel>> exercises;

  ExerciseGetDataSuccess({required this.exercises});
}

final class ExerciseGetDataFailure extends ExerciseGetDataState {
  final String err;

  ExerciseGetDataFailure({required this.err});
}
