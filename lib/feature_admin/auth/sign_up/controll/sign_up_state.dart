abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SingUpLoading extends SignUpState {}

class SingUpLoaded extends SignUpState {}

class FieldChangedState extends SignUpState {}

class LoginErrorState extends SignUpState {
  final String errorMessage;

  LoginErrorState(this.errorMessage);
}

class ChangePasswordVisibilityState extends SignUpState {}

class ValidationErrorState extends SignUpState {
  final String emailError;
  final String passError;
  final String nameError;
  final String confirmPasswordError;
  final String phoneNumberError;

  ValidationErrorState(this.emailError, this.passError, this.nameError,
      this.confirmPasswordError, this.phoneNumberError);
}
