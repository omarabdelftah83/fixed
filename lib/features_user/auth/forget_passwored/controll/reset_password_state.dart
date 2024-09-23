
abstract class ForgetPasswordState {}
 class ForgetPasswordInitial extends ForgetPasswordState {}
class FieldChangedState extends ForgetPasswordState  {}

class ForgetPasswordLoading extends ForgetPasswordState  {}
class ForgetPasswordLoaded extends ForgetPasswordState  {}
class ForgetPasswordSuccess extends ForgetPasswordState  {}
class ForgetPasswordErrorState extends ForgetPasswordState  {
  final String errorMessage;
  ForgetPasswordErrorState(this.errorMessage);
}
class ValidationErrorState extends ForgetPasswordState {
  final String emailError;

  ValidationErrorState(this.emailError, );
}