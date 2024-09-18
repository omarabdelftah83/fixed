import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:webbing_fixed/feature_admin/auth/sign_in/model/sign_in_model.dart';
import 'package:webbing_fixed/network/api_configurations.dart';
import 'package:webbing_fixed/network/faliar.dart';

class ApiService {

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
}
