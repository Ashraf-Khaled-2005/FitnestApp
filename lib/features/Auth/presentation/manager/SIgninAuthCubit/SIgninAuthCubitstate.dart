import 'package:fitness_app/features/Auth/domain/model/userModel.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final Usermodel usermodel;

  AuthSuccess({required this.usermodel});
}

class AuthError extends AuthState {
  final String error;
  AuthError({required this.error});
}
