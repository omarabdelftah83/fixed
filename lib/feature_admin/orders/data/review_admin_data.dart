import 'package:dartz/dartz.dart';
import 'package:webbing_fixed/feature_admin/orders/model/review_admin.dart';
import 'package:webbing_fixed/features_user/order/%20model/review_model_user.dart';
import 'package:webbing_fixed/network/api_configurations.dart';
import 'package:webbing_fixed/network/faliar.dart';
import 'package:webbing_fixed/network/network_handler.dart';

class ReviewAdminService {
  NetworkHandler networkHandler= NetworkHandler();
  Future<Either<Failure, ReviewAdminResponse>> reviewAdminService(ReviewAdminRequest reviewAdminRequest,int id ) async {
    try {
      final response = await networkHandler.post('http://194.164.77.238/rate_client/${id}/', reviewAdminRequest.toMap(),);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        final reviewAdminResponse = ReviewAdminResponse.fromJson(data);
        return Right(reviewAdminResponse);
      } else {
        print('Response Data: ${response.data}');
        return Left(ServerFailure(message: 'Server returned an error: ${response.statusCode}'));
      }
    } catch (error) {
      print('Dio Error: $error');
      return Left(ServerFailure(message: 'Failed to make request'));
    }
  }}