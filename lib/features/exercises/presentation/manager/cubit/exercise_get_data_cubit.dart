import 'package:bloc/bloc.dart';
import 'package:fitness_app/features/exercises/domain/repo/exerciserepo.dart';
import 'package:meta/meta.dart';

import '../../../data/model/exercise_model.dart';

part 'exercise_get_data_state.dart';

class ExerciseGetDataCubit extends Cubit<ExerciseGetDataState> {
  // ignore: non_constant_identifier_names
  final ExerciseRepo Repo;
  ExerciseGetDataCubit(this.Repo) : super(ExerciseGetDataInitial());

  getData() async {
    emit(ExerciseGetDataLoading());
    var result = await Repo.getExercises();
    result.fold((r) {
      emit(ExerciseGetDataFailure(err: r.errMessage));
    }, (l) {
      emit(ExerciseGetDataSuccess(exercises: l));
    });
  }
}
