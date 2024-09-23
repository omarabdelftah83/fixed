import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webbing_fixed/core/resource/app_string.dart';
import 'package:webbing_fixed/features_user/auth/create_new_passwored/new_passwored_page.dart';
import 'package:webbing_fixed/features_user/auth/verification/model/otp_model.dart';
import 'package:webbing_fixed/network/api_service.dart';
import 'package:webbing_fixed/network/faliar.dart';
import 'package:webbing_fixed/helpers/cache_helper.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  final ApiService apiService;
  final TextEditingController otpAddressController = TextEditingController();
  String otp = '';
  String otpError = '';

  OtpCubit(this.apiService) : super(OtpInitial());

  Future<void> buttonOtp(BuildContext context) async {
    emit(OtpLoading());

    if (!validateLogin()) {
      emit(ValidationErrorState(otpError));
      return;
    }

    try {
      String? savedEmail = await CacheHelper.getEmail();
      if (savedEmail == null || savedEmail.isEmpty) {
        emit(LoginErrorState(AppString.emailEmptyError));
        return;
      }

      final otpRe = OtpRequest(otp.trim(), savedEmail.trim());
      final res = await apiService.otp(otpRe);

      res.fold(
            (error) {
          emit(LoginErrorState(AppString.invalidCredentialsError));
        },
            (success) {
          print("API Response Message: ${success.message}");
          emit(OtpLoaded());
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const NewPasswordPage()),
          );
        },
      );
    } catch (e) {
      emit(LoginErrorState(AppString.unexpectedError));
    }
  }

  // تحديث قيمة OTP
  void onChangeOtp(String value) {
    otp = value.trim();
    otpError = '';
    emit(FieldChangedState());
  }

  // التحقق من صحة الإدخال
  bool validateLogin() {
    bool isValid = true;
    if (otp.isEmpty) {
      otpError = AppString.passwordEmptyError;
      isValid = false;
    } else {
      otpError = '';
    }
    return isValid;
  }
}
