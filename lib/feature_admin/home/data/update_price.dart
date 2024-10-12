import 'package:dartz/dartz.dart';
import 'package:webbing_fixed/feature_admin/home/model/update_price.dart';
import 'package:webbing_fixed/network/faliar.dart';
import 'package:webbing_fixed/network/network_handler.dart';

class UpdatePriceService {
  NetworkHandler networkHandler = NetworkHandler();

  Future<Either<Failure, UpdatePriceResponse>> updatePriceOrder(UpdatePriceRequest updatePriceRequest, int id ) async {
    try {
      final response = await networkHandler.put('http://194.164.77.238/order/offers/update/${id}/', updatePriceRequest.toMap(),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = UpdatePriceResponse.fromJson(response.data);
        print('Data posted successfully with status code ${response.statusCode}');
        return Right(responseData);
      } else {
        print('Failed to post data with status code: ${response.statusCode}');
        return Left(ServerFailure(message: 'Server returned an error: ${response.statusCode}'));
      }
    } catch (error) {
      print('Error occurred: $error');
      return Left(ServerFailure(message: 'Failed to make request: $error'));
    }
  }
}
