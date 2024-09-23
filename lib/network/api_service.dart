import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:webbing_fixed/feature_admin/auth/sign_up/model/sign_up_model.dart';
import 'package:webbing_fixed/features_user/auth/create_new_passwored/model/ceate_pass%20_model.dart';
import 'package:webbing_fixed/features_user/auth/forget_passwored/model/reset_model.dart';
import 'package:webbing_fixed/features_user/auth/verification/model/otp_model.dart';
import 'package:webbing_fixed/network/api_configurations.dart';
import 'package:webbing_fixed/network/faliar.dart';
import 'package:webbing_fixed/feature_admin/auth/sign_in/model/sign_in_model.dart';
import 'package:webbing_fixed/network/network_handler.dart';

class ApiService {
  NetworkHandler networkHandler= NetworkHandler();
  Future<Either<Failure, SignUpResponse>> signUp(SignUpRequest signUpRequest) async {
    try {
      final response = await Dio().post(
        ApiConfigurations.signUp,
        data: signUpRequest.toMap(),);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        final signUpResponse = SignUpResponse.fromJson(data);
        return Right(signUpResponse);
      } else {
        print('Response Data: ${response.data}');
        return Left(ServerFailure(message: 'Server returned an error: ${response.statusCode}'));
      }
    } catch (error) {
      print('Dio Error: $error');
      return Left(ServerFailure(message: 'Failed to make request'));
    }
  }
  Future<Either<Failure, SignInResponse>> signIn(SignInRequest signInRequest) async {
    try {
      final response = await Dio().post(
        ApiConfigurations.signIn,
        data: signInRequest.toMap(),);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        final signInRequest = SignInResponse.fromJson(data);
        return Right(signInRequest);
      } else {
        print('Response Data: ${response.data}');
        return Left(ServerFailure(message: 'Server returned an error: ${response.statusCode}'));
      }
    } catch (error) {
      print('Dio Error: $error');
      return Left(ServerFailure(message: 'Failed to make request'));
    }
  }
  Future<Either<Failure, ForgetPasswordResponse>> forget(ForgetPasswordRequest forgetPasswordRequest) async {
    try {
      final response = await Dio().post(
        ApiConfigurations.reset,
        data: forgetPasswordRequest.toMap(),);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        final forgetPasswordResponse = ForgetPasswordResponse.fromJson(data);
        return Right(forgetPasswordResponse);
      } else {
        print('Response Data: ${response.data}');
        return Left(ServerFailure(message: 'Server returned an error: ${response.statusCode}'));
      }
    } catch (error) {
      print('Dio Error: $error');
      return Left(ServerFailure(message: 'Failed to make request'));
    }
  }

  Future<Either<Failure, CreateNewPassResponse>> createNewPass(CreateNewPassRequest createNewPass) async {
    try {
      final response = await Dio().post(
        ApiConfigurations.createPass,
        data: createNewPass.toMap(),);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        final createNewPassResponse = CreateNewPassResponse.fromJson(data);
        return Right(createNewPassResponse);
      } else {
        print('Response Data: ${response.data}');
        return Left(ServerFailure(message: 'Server returned an error: ${response.statusCode}'));
      }
    } catch (error) {
      print('Dio Error: $error');
      return Left(ServerFailure(message: 'Failed to make request'));
    }
  }

  Future<Either<Failure, OtpResponse>> otp(OtpRequest otpRequest) async {
    try {
      print('Request Body: ${otpRequest.toMap()}');

      final response = await Dio().post(
        ApiConfigurations.otp,
        data: otpRequest.toMap(),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
          validateStatus: (status) {
            return status != null && status >= 200 && status < 500;
          },
        ),
      );

      // Check if response has expected data, even if it's 400
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        final otpResponse = OtpResponse.fromJson(data);
        return Right(otpResponse);
      } else if (response.statusCode == 400) {
        // Handle specific case of 400 Bad Request
        print('Bad Request: ${response.data}');
        return Left(ServerFailure(message: 'Invalid request: ${response.data}'));
      } else {
        // Other server errors
        print('Response Data: ${response.data}');
        return Left(ServerFailure(message: 'Server returned an error: ${response.statusCode}'));
      }
    } catch (error) {
      // Catching Dio exceptions or other errors
      print('Dio Error: $error');
      return Left(ServerFailure(message: 'Failed to make request'));
    }
  }





}
