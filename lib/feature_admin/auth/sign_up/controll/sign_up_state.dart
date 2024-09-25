import 'package:webbing_fixed/feature_admin/auth/sign_up/model/get_all_services_model.dart';

abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class ImageUploadingState extends SignUpState {
  final String imageType;
  ImageUploadingState(this.imageType);
}

class ImageUploadCompletedState extends SignUpState {
  final String imageType;
  ImageUploadCompletedState(this.imageType);
}

class ServicesLoaded extends SignUpState {
  final List<GetAllServicesModel> services;
  ServicesLoaded(this.services);
}

class SignUpLoaded extends SignUpState {}

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

  ValidationErrorState(
      this.emailError,
      this.passError,
      this.nameError,
      this.confirmPasswordError,
      this.phoneNumberError
      );
}
