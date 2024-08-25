part of 'getexerciseindeses_cubit.dart';

@immutable
sealed class GetexerciseindesesState {}

final class GetexerciseindesesInitial extends GetexerciseindesesState {}

final class GetexerciseindesesLoading extends GetexerciseindesesState {}

final class GetexerciseindesesLoaded extends GetexerciseindesesState {
  final Exercisedone exercise;
  GetexerciseindesesLoaded({required this.exercise});
}

final class GetexerciseindesesError extends GetexerciseindesesState {
  final String error;
  GetexerciseindesesError({required this.error});
}
