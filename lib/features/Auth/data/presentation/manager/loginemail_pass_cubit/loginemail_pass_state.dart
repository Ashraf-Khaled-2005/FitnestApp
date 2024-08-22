part of 'loginemail_pass_cubit.dart';

@immutable
sealed class LoginemailPassState {}

final class LoginemailPassInitial extends LoginemailPassState {}

class LoginLoading extends LoginemailPassState {}

class LoginSuccess extends LoginemailPassState {}

class LoginError extends LoginemailPassState {
  final String error;

  LoginError({required this.error});
}
