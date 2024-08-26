import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/features/Auth/domain/auth_repo.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';

part 'loginwithgoogle_state.dart';

class LoginwithgoogleCubit extends Cubit<LoginwithgoogleState> {
  final AuthRepo authrepo;
  LoginwithgoogleCubit(this.authrepo) : super(LoginwithgoogleInitial());

  LoginWithGoogle() async {
    emit(Loginwithgoogleloading());
    var result = await authrepo.LoginwithGoogle();
    result.fold((l) {
      emit(Loginwithgooglefailure(err: l.errMessage));
    }, (r) {
      emit(Loginwithgooglesuccess(usercredential: r.$1, googlesignin: r.$2));
    });
  }
}
