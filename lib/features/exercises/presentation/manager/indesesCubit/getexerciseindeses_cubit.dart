import 'package:fitness_app/features/exercises/data/model/exercisedone.dart';
import 'package:fitness_app/features/exercises/domain/repo/exerciserepo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'getexerciseindeses_state.dart';

class GetexerciseindesesCubit extends Cubit<GetexerciseindesesState> {
  final ExerciseRepo repo;
  GetexerciseindesesCubit(this.repo) : super(GetexerciseindesesInitial());
  late Exercisedone done;

  getdata({required String id, required String userid}) async {
    emit(GetexerciseindesesLoading());
    var data = await repo.getexercisesDone(id: id, userid: userid);
    data.fold((l) {
      emit(GetexerciseindesesError(error: l.errMessage));
    }, (r) {
      if (r != null) {
        done = r;
        emit(GetexerciseindesesLoaded(exercise: r));
      } else {
        emit(GetexerciseindesesInitial());
      }
    });
  }
}
