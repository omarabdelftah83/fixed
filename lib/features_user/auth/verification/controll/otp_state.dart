part of 'otp_cubit.dart';

@immutable
sealed class OtpState {}

final class OtpInitial extends OtpState {}
class OtpLoading extends OtpState {}
class OtpLoaded extends OtpState {}
class AuthSuccess extends OtpState {}
class LoginErrorState extends OtpState {
  final String errorMessage;
  LoginErrorState(this.errorMessage);
}
class OtpFailure extends OtpState {
  final Failure failure;
  OtpFailure(this.failure);
}
class FieldChangedState extends OtpState {}

class ValidationErrorState extends OtpState {
  final String emailError;

  ValidationErrorState(this.emailError, );
}