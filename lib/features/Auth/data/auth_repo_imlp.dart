import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/core/failures.dart';
import 'package:fitness_app/features/Auth/data/domain/auth_repo.dart';
import 'package:fitness_app/features/Auth/data/domain/model/userModel.dart';

class AuthRepoImpl extends AuthRepo {
  @override
  Future<Either<Failure, Usermodel>> signupwithemailandpassword(
      {required String email,
      required String f_name,
      required String L_name,
      required String id,
      required String pass,
      required String gender,
      required String wight,
      required String hight,
      required String date}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      return right(Usermodel(
          f_name: f_name,
          L_name: L_name,
          email: email,
          id: id,
          gender: gender,
          wight: wight,
          hight: hight,
          date: date));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return left(ServerFailure('The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        return left(
            ServerFailure('The account already exists for that email.'));
      } else {
        return left(ServerFailure('please try again'));
      }
    } catch (e) {
      return left(ServerFailure('please try again'));
    }
  }

  @override
  Future<Either<Failure, void>> Loginwithemailandpassword(
      {required String email, required String pass}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pass);
      return right(null);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return left(ServerFailure('No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        return left(ServerFailure('Wrong password provided for that user.'));
      } else {
        return left(ServerFailure('please try again'));
      }
    }
  }
}
