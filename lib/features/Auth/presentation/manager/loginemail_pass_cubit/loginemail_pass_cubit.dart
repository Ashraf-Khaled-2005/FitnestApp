import 'package:bloc/bloc.dart';
import 'package:fitness_app/features/Auth/domain/auth_repo.dart';
import 'package:fitness_app/features/Auth/domain/model/userModel.dart';
import 'package:meta/meta.dart';

part 'loginemail_pass_state.dart';

class LoginemailPassCubit extends Cubit<LoginemailPassState> {
  late Usermodel usermodel;
  final AuthRepo authRepo;
  LoginemailPassCubit(this.authRepo) : super(LoginemailPassInitial());

  LoginWithEmailPass({required String email, required String pass}) async {
    emit(LoginLoading());
    var result =
        await authRepo.Loginwithemailandpassword(email: email, pass: pass);
    result.fold((l) {
      emit(LoginError(error: l.errMessage));
    }, (r) {
      emit(LoginSuccess());
    });
  }
}
