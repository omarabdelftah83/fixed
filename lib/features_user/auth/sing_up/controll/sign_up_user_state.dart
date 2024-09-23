
abstract class SignUpUserState {}

final class SignUpUserInitial extends SignUpUserState {}
class SignUpInitial extends SignUpUserState {}

class SingUpLoading extends SignUpUserState {}

class SingUpLoaded extends SignUpUserState {}

class FieldChangedState extends SignUpUserState {}

class LoginErrorState extends SignUpUserState {
  final String errorMessage;

  LoginErrorState(this.errorMessage);
}

class ChangePasswordVisibilityState extends SignUpUserState {}

class ValidationErrorState extends SignUpUserState {
  final String emailError;
  final String passError;
  final String nameError;
  final String confirmPasswordError;
  final String phoneNumberError;

  ValidationErrorState(this.emailError, this.passError, this.nameError,
      this.confirmPasswordError, this.phoneNumberError);
}
