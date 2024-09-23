import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webbing_fixed/core/resource/app_string.dart';
import 'package:webbing_fixed/feature_admin/auth/sign_up/sign_up_export.dart';
import 'package:webbing_fixed/features_user/auth/create_new_passwored/model/ceate_pass%20_model.dart';
import 'package:webbing_fixed/features_user/onboarding/screen/In_home_page.dart';
import 'package:webbing_fixed/helpers/cache_helper.dart';
import 'package:webbing_fixed/network/faliar.dart';
part 'create_new_password_state.dart';

class CreateNewPasswordCubit extends Cubit<CreateNewPasswordState> {
  final ApiService apiService;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();
  String pass = '';
  String passError = '';
  String confirmPassword = '';
  String confirmPasswordError = '';

  CreateNewPasswordCubit(this.apiService) : super(CreateNewPasswordInitial()) {
    print(state); // Initial state print
  }

  Future<void> buttonCreatePass(BuildContext context) async {
    emit(CreateNewPasswordLoading());
    print(state); // Print the current state

    if (!validateLogin()) {
      emit(ValidationErrorState(passError, confirmPasswordError));
      print(state); // Print the current state
      return;
    }

    try {
      String? savedEmail = await CacheHelper.getEmail();
      if (savedEmail == null || savedEmail.isEmpty) {
        emit(LoginErrorState(AppString.emailEmptyError));
        return;
      }

      final res = await apiService.createNewPass(
        CreateNewPassRequest(savedEmail, passwordController.text,
            passwordConfirmController.text),
      );

      res.fold(
        (error) {
          emit(LoginErrorState(AppString.invalidCredentialsError));
          print(state);
        },
        (success) async {
          emit(CreateNewPasswordLoaded());

          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) =>  InHomePage()),
          );
          },
      );
    } catch (e) {
      emit(LoginErrorState(AppString.unexpectedError));
      print(state); // Print the current state
    }
  }

  void onChangePass(String value) {
    pass = value;
    passError = '';
    emit(FieldChangedState());
    print(state); // Print the current state
  }

  void onChangeConfirmPassword(String value) {
    confirmPassword = value;
    confirmPasswordError = '';
    emit(FieldChangedState());
    print(state); // Print the current state
  }

  bool validateLogin() {
    bool isValid = true;
    if (confirmPassword.isEmpty) {
      confirmPasswordError = AppString.confirmPasswordEmptyError;
      isValid = false;
    } else if (confirmPassword != pass) {
      confirmPasswordError = AppString.passwordsDoNotMatchError;
      isValid = false;
    } else {
      confirmPasswordError = '';
    }

    if (pass.isEmpty) {
      passError = AppString.passwordEmptyError;
      isValid = false;
    } else {
      passError = '';
    }

    return isValid;
  }
}
