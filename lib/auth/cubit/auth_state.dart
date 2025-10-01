part of 'auth_cubit.dart';


sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class OtpSent extends AuthState {
  final String mobileNumber;

  OtpSent(this.mobileNumber);

}

final class Authenticated extends AuthState {}

