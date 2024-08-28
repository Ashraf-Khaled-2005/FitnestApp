import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/features/Auth/domain/model/userModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/auth_repo.dart';
import 'SIgninAuthCubitstate.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;
  AuthCubit(this.authRepo) : super(AuthInitial());
  late Usermodel user;
  Future<void> SigninAuth(
      {required String email,
      required String f_name,
      required String L_name,
      required String pass,
      required String image,
      required String gender,
      required String wight,
      required String hight,
      required String date}) async {
    emit(AuthLoading());
    var response = await authRepo.signupwithemailandpassword(
        email: email,
        f_name: f_name,
        image: image,
        L_name: L_name,
        pass: pass,
        gender: gender,
        wight: wight,
        hight: hight,
        date: date);

    response.fold((l) {
      emit(AuthError(error: l.errMessage));
    }, (r) async {
      await FirebaseFirestore.instance
          .collection('USERS')
          .doc((FirebaseAuth.instance.currentUser!.uid))
          .set({
        'email': email,
        'f_name': f_name,
        'image': image,
        'L_name': L_name,
        'latestExercis': [],
        'id': FirebaseAuth.instance.currentUser!.uid,
        'gender': gender,
        'wight': wight,
        'hight': hight,
        'date': date
      });
      user = r;
      emit(AuthSuccess(usermodel: r));
    });
  }
}
