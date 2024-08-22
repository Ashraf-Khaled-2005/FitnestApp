import 'package:dartz/dartz.dart';
import 'package:fitness_app/core/failures.dart';

import 'model/userModel.dart';

abstract class AuthRepo {
  Future<Either<Failure, Usermodel>> signupwithemailandpassword(
      {required String email,
      required String f_name,
      required String L_name,
      required String id,
      required String pass,
      required String gender,
      required String wight,
      required String hight,
      required String date});

  Future<Either<Failure, void>> Loginwithemailandpassword({
    required String email,
    required String pass,
  });
}
