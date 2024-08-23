import 'package:dartz/dartz.dart';
import 'package:fitness_app/core/failures.dart';
import 'package:fitness_app/features/exercises/data/model/exercise_model.dart';

abstract class ExerciseRepo {
  Future<Either<Failure, List<List<ExerciseModel>>>> getExercises();
}
