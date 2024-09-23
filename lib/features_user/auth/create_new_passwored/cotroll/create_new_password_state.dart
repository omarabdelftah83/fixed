part of 'create_new_password_cubit.dart';

@immutable
sealed class CreateNewPasswordState {}

final class CreateNewPasswordInitial extends CreateNewPasswordState {}
class FieldChangedState extends CreateNewPasswordState {}
class CreateNewPasswordLoading extends CreateNewPasswordState {}
class CreateNewPasswordLoaded extends CreateNewPasswordState {}
class CreateNewPasswordSuccess extends CreateNewPasswordState {}
class LoginErrorState extends CreateNewPasswordState {
  final String errorMessage;
  LoginErrorState(this.errorMessage);
}
class CreateNewPasswordFailure extends CreateNewPasswordState {
  final Failure failure;
  CreateNewPasswordFailure(this.failure);
}
class ValidationErrorState extends CreateNewPasswordState {
  final String passError;
  final String passConfirmError;

  ValidationErrorState(this.passError, this.passConfirmError);
}