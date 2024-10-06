import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:webbing_fixed/core/resource/app_string.dart';
import 'package:webbing_fixed/feature_admin/auth/sign_in/controll/sign_in_state.dart';
import 'package:webbing_fixed/feature_admin/auth/sign_in/model/sign_in_model.dart';
import 'package:webbing_fixed/feature_admin/mainlayout/main_layout_admin_page.dart';
import 'package:webbing_fixed/features_user/main_layout/presentaion/mainlayout_page.dart';
import 'package:webbing_fixed/helpers/cache_helper.dart';
import 'package:webbing_fixed/network/api_service.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.apiService) : super(SignInInitial());
  String email = '';
  String emailError = '';
  String password = '';
  String passError = '';
  final ApiService apiService;
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> buttonSignIn(BuildContext context) async {
    emit(SingInLoading());

    if (!validateInput()) {
      emit(ValidationErrorState(emailError, passError));
      return;
    }

    try {
      final signInRequest = SignInRequest(emailAddressController.text, passwordController.text);
      final res = await apiService.signIn(signInRequest);
      res.fold(
            (error) {
          emit(LoginErrorState(AppString.invalidCredentialsError));
          showSnackbar(context, AppString.invalidCredentialsError, Colors.red);
        },
            (success) async {
          if (success.accessToken != null) {
            await CacheHelper.saveToken(success.accessToken!);
          }
          print('Success: ${success.accessToken}');
          emit(SingInLoaded());
          showSnackbar(context, AppString.invalidSuccess, Colors.green);

          if (success.provider == true) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const MainLayoutPageAdmin(),
              ),
            );
          } else {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const MainLayoutPage(),
              ),
            );
          }
        },
      );
    } catch (e) {
      emit(LoginErrorState(AppString.unexpectedError));
      showSnackbar(context, AppString.unexpectedError, Colors.red);
    }
  }


  bool validateInput() {
    bool isValid = true;
    if (email.isEmpty) {
      emailError = AppString.emailEmptyError;
      isValid = false;
    } else {
      emailError = '';
    }

    if (password.isEmpty) {
      passError = AppString.passwordEmptyError;
      isValid = false;
    } else {
      passError = '';
    }

    return isValid;
  }

  void onChangeEmail(String value) {
    email = value;
    emailError = '';
    emit(FieldChangedState());
  }

  void onChangePass(String value) {
    password = value;
    passError = '';
    emit(FieldChangedState());
  }



  void showSnackbar(BuildContext context, String message, Color? color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }

}
