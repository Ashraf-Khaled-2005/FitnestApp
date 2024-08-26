part of 'loginwithgoogle_cubit.dart';

@immutable
sealed class LoginwithgoogleState {}

final class LoginwithgoogleInitial extends LoginwithgoogleState {}

final class Loginwithgooglefailure extends LoginwithgoogleState {
  final String err;

  Loginwithgooglefailure({required this.err});
}

final class Loginwithgooglesuccess extends LoginwithgoogleState {
  final UserCredential? usercredential;
  final GoogleSignInAccount? googlesignin;

  Loginwithgooglesuccess(
      {required this.usercredential, required this.googlesignin});
}

final class Loginwithgoogleloading extends LoginwithgoogleState {}
