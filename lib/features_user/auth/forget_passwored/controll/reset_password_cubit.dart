import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:webbing_fixed/core/resource/app_string.dart';
import 'package:webbing_fixed/features_user/auth/forget_passwored/controll/reset_password_state.dart';
import 'package:webbing_fixed/features_user/auth/forget_passwored/model/reset_model.dart';
import 'package:webbing_fixed/features_user/auth/verification/verification_page.dart';
import 'package:webbing_fixed/helpers/cache_helper.dart';
import 'package:webbing_fixed/network/api_service.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ApiService apiService;
  final TextEditingController emailAddressController = TextEditingController();
  String email = '';
  String emailError = '';

  ForgetPasswordCubit(this.apiService) : super(ForgetPasswordInitial());

  Future<void> buttonForgetPassword(BuildContext context) async {
    emit(ForgetPasswordLoading());

    email = emailAddressController.text;
     await CacheHelper.saveEmail(email);

    if (!validateLogin()) {
      emit(ValidationErrorState(emailError));
      return;
    }

    try {
      final forgetPasswordRequest = await ForgetPasswordRequest(emailAddressController.text);
      final res = await apiService.forget(forgetPasswordRequest);
      res.fold(
            (error) {
          emit(ForgetPasswordErrorState(AppString.invalidCredentialsError));
          showSnackbar(context, AppString.invalidCredentialsError, Colors.red);

            },
            (success) async {
          emit(ForgetPasswordLoaded());
          showSnackbar(context, AppString.invalidSuccess, Colors.green);

          // عرض حوار OTP
          await showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Enter OTP'),
                content: const Text('A reset link has been sent to your email. Please enter the OTP sent to your email.'),
                actions: <Widget>[
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const VerificationPage()),
                      );
                    },
                  ),
                ],
              );
            },
          );
        },
      );
    } catch (e) {
      emit(ForgetPasswordErrorState(AppString.unexpectedError));
      showSnackbar(context, AppString.invalidCredentialsError, Colors.red);

    }
  }

  void onChangeEmail(String value) {
    email = value;
    emailError = '';
    emit(FieldChangedState());
  }

  bool validateLogin() {
    bool isValid = true;
    if (email.isEmpty) {
      emailError = AppString.emailEmptyError;
      isValid = false;
    } else {
      emailError = '';
    }
    return isValid;
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
