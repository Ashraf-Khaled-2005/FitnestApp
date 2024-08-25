part of 'getuserdata_cubit.dart';

@immutable
sealed class GetuserdataState {}

final class GetuserdataInitial extends GetuserdataState {}

final class Getuserdatafail extends GetuserdataState {
  final String err;

  Getuserdatafail({required this.err});
}

final class Getuserdatasucess extends GetuserdataState {
  final Usermodel user;

  Getuserdatasucess({required this.user});
}

final class Getuserdataloading extends GetuserdataState {}
