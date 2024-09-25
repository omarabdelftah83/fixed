
abstract class SignInState {}

final class SignInInitial extends SignInState {}
class FieldChangedState extends SignInState {}
class SingInLoading extends SignInState {}
class SingInLoaded extends SignInState {}


class LoginErrorState extends SignInState {
  final String errorMessage;
  LoginErrorState(this.errorMessage);
}
class ValidationErrorState extends SignInState {
  final String emailError;
  final String passError;

  ValidationErrorState(this.emailError, this.passError);
}