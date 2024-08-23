import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fitness_app/core/failures.dart';
import 'package:fitness_app/features/exercises/data/model/exercise_model.dart';

import '../../domain/repo/exerciserepo.dart';

class Exerciserepoimple extends ExerciseRepo {
  final Dio dio;

  Exerciserepoimple({required this.dio});
  @override
  Future<Either<Failure, List<List<ExerciseModel>>>> getExercises() async {
    try {
      Response response = await dio.get(
        options: Options(headers: {
          'x-rapidapi-key': "eed42165e0mshe075699e725bafdp1da534jsnd28514ae97cf"
        }),
        'https://exercisedb.p.rapidapi.com/exercises?limit=50',
      );
      List<ExerciseModel> exercises = [];

      for (int i = 0; i < response.data.length; i++) {
        exercises.add(ExerciseModel.fromJson(response.data[i]));
      }
      Map<String, List<ExerciseModel>> groupedExercises = {};
      for (var exercise in exercises) {
        if (groupedExercises.containsKey(exercise.bodyPart)) {
          groupedExercises[exercise.bodyPart]!.add(exercise);
        } else {
          groupedExercises[exercise.bodyPart!] = [exercise];
        }
      }
      List<List<ExerciseModel>> list = groupedExercises.values.toList();
      log(list.toString());
      return right(list);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    }
  }
}
